//
//  Navigation.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 19/07/2021.
//  https://medium.com/double-symmetry/navigating-without-navigationlink-in-swiftui-afd8109f0602
//

import SwiftUI

struct NavigationBarTitleConfiguration {
	let title: String
	let displayMode: NavigationBarItem.TitleDisplayMode
}

protocol DestinationView {
	var navigationBarTitleConfiguration: NavigationBarTitleConfiguration { get }
}

class DestinationHostingController<T: View>: UIHostingController<T> {
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		let rootMirror = Mirror(reflecting: rootView)
		
		let storageMirror = rootView is AnyView ? rootMirror : Mirror(reflecting: rootMirror.descendant("content")!)
		let navigationTitleConfiguration = extractNavigationTitleConfiguration(storageMirror: storageMirror)
		
		if let navigationTitleConfiguration = navigationTitleConfiguration {
			navigationItem.title = navigationTitleConfiguration.title
			//            navigationItem.largeTitleDisplayMode = navigationTitleConfiguration.displayMode
		}
	}
	
	private func extractNavigationTitleConfiguration(storageMirror: Mirror) -> NavigationBarTitleConfiguration? {
		guard let storage = storageMirror.descendant("storage") else { return nil }
		let storageMirror = Mirror(reflecting: storage)
		
		guard let swiftUIView = storageMirror.descendant("view") else { return nil }
		if let view = swiftUIView as? DestinationView {
			return view.navigationBarTitleConfiguration
		}
		
		return nil
	}
}

class Navigation: ObservableObject {
	let window: UIWindow
	
	init(window: UIWindow) {
		self.window = window
	}
	
	func pushView(_ view: AnyView, animated: Bool = true) {
		let controller = DestinationHostingController(rootView: view.environmentObject(self))
		pushViewController(controller, animated: animated)
	}
	
	func popToRoot(animated: Bool = true, completion: @escaping () -> Void) {
		popToRootViewController(animated: animated, completion: completion)
	}
	
	func popToRootAndPushTo(_ view: AnyView, animated: Bool = true) {
		popToRoot(animated: animated) {
			self.pushView(view, animated: animated)
		}
	}
	
	func popToPrevious(animated: Bool = true, completion: @escaping () -> Void) {
		popViewController(animated: animated, completion: completion)
	}
}

private extension Navigation {
	func pushViewController(_ viewController: UIViewController, animated: Bool = true) {
		let nvc = window.rootViewController?.children.first as? UINavigationController
		nvc?.pushViewController(viewController, animated: animated)
	}
	
	func popToRootViewController(animated: Bool = true, completion: @escaping () -> Void) {
		let nvc = window.rootViewController?.children.first as? UINavigationController
		nvc?.popToRootViewController(animated: animated, completion: completion)
	}
	
	func popViewController(animated: Bool = true, completion: @escaping () -> Void) {
		let nvc = window.rootViewController?.children.first as? UINavigationController
		nvc?.popViewController(animated: animated, completion: completion)
	}
	
	func switchRootViewController(rootViewController: UIViewController, animated: Bool = true, completion: (() -> Void)?) {
		if animated {
			UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: {
				let oldState: Bool = UIView.areAnimationsEnabled
				UIView.setAnimationsEnabled(false)
				self.window.rootViewController = rootViewController
				UIView.setAnimationsEnabled(oldState)
			}, completion: { (finished: Bool) -> () in
				if (completion != nil) {
					completion!()
				}
			})
		} else {
			window.rootViewController = rootViewController
		}
	}
}

extension UINavigationController {
	func pushViewController(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void) {
		CATransaction.begin()
		CATransaction.setCompletionBlock(completion)
		pushViewController(viewController, animated: animated)
		CATransaction.commit()
	}
	
	func popViewController(animated: Bool = true, completion: @escaping () -> Void) {
		CATransaction.begin()
		CATransaction.setCompletionBlock(completion)
		popViewController(animated: animated)
		CATransaction.commit()
	}
	
	func popToRootViewController(animated: Bool = true, completion: @escaping () -> Void) {
		CATransaction.begin()
		CATransaction.setCompletionBlock(completion)
		popToRootViewController(animated: animated)
		CATransaction.commit()
	}
}

class BaseCoordinator {
//	var navigator: Navigation? {
//		guard let window = self.currentWindow() else {
//			return nil
//		}
//
//		return Navigation(window: window)
//	}
	
//	private func currentWindow() -> UIWindow? {
//		let scene = UIApplication.shared.connectedScenes.first
//		guard let sd = scene?.delegate as? SceneDelegate else {
//			return nil
//		}
//		
//		return sd.window
//	}
}

//extension BaseCoordinator {
//	func homeView() -> AnyView? {
//		guard let view: HomeContentView<HomeViewModelImpl> = homeViewConstructor() else {
//			return nil
//		}
//
//		return AnyView(view)
//	}
//
//	func eventMakerView(viewType: EventMakerType, eventModel: EventModel? = nil) -> AnyView? {
//		guard let view: EventMakerView<EventMakerViewModelImpl>
//				= eventMakerViewConstructor(viewType: viewType, eventModel: eventModel) else {
//			return nil
//		}
//
//		return AnyView(view)
//	}
//
//	func detailEventView(eventId: String) -> AnyView? {
//		let coordinator = DetailCoordinatorImpl()
//		return AnyView(DetailView()
//						.environmentObject(DetailViewModel.init(coordinator: coordinator,
//																eventId: eventId,
//																user: AuthManager.shared.userInfo)))
//	}
//
//	func userOutputListView(event: EventModel) -> AnyView? {
//		guard let view: EventOutputListView<EventOutputViewModelImpl> = userOutputListViewConstructor(event: event) else {
//			return nil
//		}
//
//		return AnyView(view)
//	}
//
//	func userOutputListView(survey: SurveyModel) -> AnyView? {
//		guard let view: SurveyOutputListView<SurveyOutputViewModelImpl> = userOutputListViewConstructor(survey: survey) else {
//			return nil
//		}
//
//		return AnyView(view)
//	}
//
//
//	func detailSurveyView(surveyId: String) -> AnyView? {
//		let coordinator = DetailCoordinatorImpl()
//		return AnyView(DetailSurveyView()
//					.environmentObject(DetailSurveyViewModel.init(surveyId: surveyId,
//															user: AuthManager.shared.userInfo, coordinator: coordinator)))
//
//	}
//
//	func surveyMakerView(viewType: SurveyMakerType, surveyModel: SurveyModel? = nil) -> AnyView? {
//		guard let view: SurveyMakerView<SurveyMakerViewModelImpl>
//				= surveyMakerViewConstructor(viewType: viewType, surveyModel: surveyModel) else {
//			return nil
//		}
//
//		return AnyView(view)
//	}
//
//	func resetPasswordView() -> AnyView? {
//		guard let view: ResetPasswordView<ResetPasswordViewModelImpl> = resetPasswordViewConstructor()else {
//			return nil
//		}
//
//		return AnyView(view)
//	}
//
//	func signInView() -> AnyView? {
//		guard let view: SignInContentView<SignInContentViewModelImpl> = signInViewConstructor() else {
//			return nil
//		}
//
//		return AnyView(view)
//	}
//
//	func signUpView() -> AnyView? {
//		guard let view: SignUpContentView<SignUpContentViewModelImpl> = signUpViewConstructor() else {
//			return nil
//		}
//
//		return AnyView(view)
//	}
//
//	func qrCodeView(event: EventModel?) -> AnyView? {
//		AnyView(QRCodeView().environmentObject(QRCodeViewModel.init(item: event,
//																	user: AuthManager.shared.userInfo)))
//	}
//
//	func seenView(itemId: String, eventUseCase: EventUseCase?, surveyUseCase: SurveyUseCase?) -> AnyView? {
//
//		let model = OutputSeenViewModelImpl(itemId: itemId, eventUseCase: eventUseCase, surveyUseCase: surveyUseCase)
//		return AnyView(OutputSeenView<OutputSeenViewModelImpl>(viewModel: model))
//	}
//}
//
//private extension BaseCoordinator {
//	func homeViewConstructor<VM>() -> HomeContentView<VM>? {
//		let coordinator = HomeCoordinatorImpl()
//		guard let homeViewModel = HomeViewModelImpl(coordinator: coordinator) as? VM else {
//			return nil
//		}
//
//		let eventNetwork = EventNetworkImpl()
//		let notiNetwork = NotificationNetworkImpl()
//		let eventRepo = EventRepositoryImpl(network: eventNetwork, notiNetwork: notiNetwork)
//		let eventUseCase = EventUseCaseImpl(repository: eventRepo)
//
//		let surveyNetwork = SurveyNetworkImpl()
//		let surveyRepo = SurveyRepositoryImpl(network: surveyNetwork, notiNetwork: notiNetwork)
//		let surveyUseCase = SurveyUseCaseImpl(repository: surveyRepo)
//
//		let timelineViewModel = TimelineViewModelImpl(coordinator: coordinator,
//													eventUseCase: eventUseCase,
//													surveyUseCase: surveyUseCase)
//
//		return HomeContentView<VM>(viewModel: homeViewModel,
//								   timelineViewModel: timelineViewModel)
//	}
//
//	func eventMakerViewConstructor<VM>(viewType: EventMakerType, eventModel: EventModel? = nil) -> EventMakerView<VM>? {
//		let eventNetwork = EventNetworkImpl()
//		let notiNetwork = NotificationNetworkImpl()
//		let eventRepositoryImpl = EventRepositoryImpl(network: eventNetwork, notiNetwork: notiNetwork)
//		let eventUseCase = EventUseCaseImpl(repository: eventRepositoryImpl)
//		let coordinator = EventMakerCoordinatorImpl()
//		guard let viewModel = EventMakerViewModelImpl(coordinator: coordinator,
//													  eventUseCase: eventUseCase,
//													  eventModel: eventModel) as? VM else {
//			return nil
//		}
//
//		return EventMakerView<VM>(viewModel: viewModel, viewType: viewType)
//	}
//
//	func surveyMakerViewConstructor<VM>(viewType: SurveyMakerType, surveyModel: SurveyModel? = nil) -> SurveyMakerView<VM>? {
//		let surveyNetwork = SurveyNetworkImpl()
//		let notiNetwork = NotificationNetworkImpl()
//		let surveyRepository = SurveyRepositoryImpl(network: surveyNetwork, notiNetwork: notiNetwork)
//		let surveyUseCase = SurveyUseCaseImpl(repository: surveyRepository)
//		let coordinator = SurveyMakerCoordinatorImpl()
//		guard let viewModel = SurveyMakerViewModelImpl(coordinator: coordinator,
//														 surveyUseCase: surveyUseCase,
//														 surveyModel: surveyModel) as? VM else {
//			return nil
//		}
//
//		return SurveyMakerView<VM>(viewModel: viewModel, viewType: viewType)
//	}
//
//	func userOutputListViewConstructor<VM>(event: EventModel) -> EventOutputListView<VM>? {
//		let eventNetwork = EventNetworkImpl()
//		let notificationNetwork = NotificationNetworkImpl()
//		let eventRepository = EventRepositoryImpl(network: eventNetwork, notiNetwork: notificationNetwork)
//		let useCase = EventUseCaseImpl(repository: eventRepository)
//		guard let viewModel = EventOutputViewModelImpl(eventUseCase: useCase, event: event) as? VM else {
//			return nil
//		}
//
//		return EventOutputListView<VM>(viewModel: viewModel)
//	}
//
//	func userOutputListViewConstructor<VM>(survey: SurveyModel) -> SurveyOutputListView<VM>? {
//		guard let viewModel = SurveyOutputViewModelImpl(useCase: SurveyUseCaseImpl(repository: SurveyRepositoryImpl(network: SurveyNetworkImpl(), notiNetwork: NotificationNetworkImpl())), surveyItem: survey) as? VM else {
//			return nil
//		}
//
//		return SurveyOutputListView<VM>(viewModel: viewModel)
//	}
//
//	func resetPasswordViewConstructor<VM>() -> ResetPasswordView<VM>? {
//		let userNetwork = UserNetworkImpl()
//		let userRepository = UserRepositoryImpl(network: userNetwork, notiNetwork: NotificationNetworkImpl())
//		let userUseCase = UserUseCaseImpl(repository: userRepository)
//		let coordinator = ResetPasswordCoordinatorImpl()
//		guard let viewModel = ResetPasswordViewModelImpl(coordinator: coordinator,
//														 userUseCase: userUseCase) as? VM else {
//			return nil
//		}
//
//		return ResetPasswordView<VM>(viewModel: viewModel)
//	}
//
//	func signInViewConstructor<VM>() -> SignInContentView<VM>? {
//		let coordinator = SignInCoordinatorImpl()
//		guard let viewModel = SignInContentViewModelImpl(coordinator: coordinator) as? VM else {
//			return nil
//		}
//
//		return SignInContentView<VM>(viewModel: viewModel)
//	}
//
//	func signUpViewConstructor<VM>() -> SignUpContentView<VM>? {
//		let coordinator = SignUpCoordinatorImpl()
//		let userNetwork = UserNetworkImpl()
//		let userRepo = UserRepositoryImpl(network: userNetwork, notiNetwork: NotificationNetworkImpl())
//		let userUseCase = UserUseCaseImpl(repository: userRepo)
//		guard let viewModel = SignUpContentViewModelImpl(coordinator: coordinator,
//														 userUseCase: userUseCase) as? VM else {
//			return nil
//		}
//
//		return SignUpContentView<VM>(viewModel: viewModel)
//	}
//}
