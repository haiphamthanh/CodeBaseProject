//
//  UIRegister.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 12/04/2022.
//

import Swinject

class UIRegister {
	private weak var container: Container!
	init(_ container: Container) {
		self.container = container
	}
	
	func start() {
		return registerUserInterface()
	}
}

private extension UIRegister {
	func registerUserInterface() {
		//MARK: ------------------------------------ INTRODUCTION ------------------------------------
		container.register(IntroViewModel.self) { _ in IntroViewModelImpl() }
		container.register(IntroCoordinator.self) { r in
			@Inject var viewModel: IntroViewModel
			guard let viewModel = viewModel as? ViewModelRule else {
				fatalError("View model need to confirm to ViewModelRule")
			}
			
			let view = ViewInstance.introView(viewModel: viewModel)
			return IntroCoordinatorImpl(view: view, viewModel: viewModel)
		}
		
		//MARK: ------------------------------------ ROOT ------------------------------------
		container.register(RootViewModel.self) { _ in RootViewModelImpl() }
		container.register(RootCoordinator.self) { r in
			@Inject var viewModel: RootViewModel
			guard let viewModel = viewModel as? ViewModelRule else {
				fatalError("View model need to confirm to ViewModelRule")
			}
			
			let view = ViewInstance.rootView(viewModel: viewModel)
			return RootCoordinatorImpl(view: view, viewModel: viewModel)
		}
		
		//MARK: ------------------------------------ TOP ------------------------------------
		container.register(TopViewModel.self) { _ in TopViewModelImpl() }
		container.register(TopCoordinator.self) { r in
			@Inject var viewModel: TopViewModel
			guard let viewModel = viewModel as? ViewModelRule else {
				fatalError("View model need to confirm to ViewModelRule")
			}
			
			let view = ViewInstance.topView(viewModel: viewModel)
			return TopCoordinatorImpl(view: view, viewModel: viewModel)
		}
		
		//MARK: ------------------------------------ TOP_HOME ------------------------------------
		container.register(TopHomeViewModel.self) { _ in TopHomeViewModelImpl() }
		container.register(TopSearchViewModel.self) { _ in TopSearchViewModelImpl() }
		container.register(TopNotificationViewModel.self) { _ in TopNotificationViewModelImpl() }
		container.register(TopVideoViewModel.self) { _ in TopVideoViewModelImpl() }
		
		//MARK: ------------------------------------ HOME ------------------------------------
		container.register(HomeViewModel.self) { _ in HomeViewModelImpl() }
		container.register(HomeCoordinator.self) { r in
			@Inject var viewModel: HomeViewModel
			guard let viewModel = viewModel as? ViewModelRule else {
				fatalError("View model need to confirm to ViewModelRule")
			}
			
			let view = ViewInstance.homeView(viewModel: viewModel)
			return HomeCoordinatorImpl(view: view, viewModel: viewModel)
		}
	}
}
