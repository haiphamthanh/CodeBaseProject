//
//  AppRootCoordinator.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 26/07/2021.
//

/*
 import SwiftUI
 import RxSwift
 
 protocol AppRootCoordinator {
 func startProcess() -> Observable<Void>
 }
 
 class AppRootCoordinatorImpl: CoordinatorAdapter<Void>, CoordinatorRule, AppRootCoordinator {
 typealias ViewModel = AppRootViewModelCoorSupport
 typealias Navigator = NavigationProvider
 let navigator: Navigator
 let viewModel: ViewModel
 let view: AnyView
 
 init(navigator: Navigator, viewModel: ViewModel, view: AnyView) {
 guard let validViewModel = viewModel as? ViewModelRule else {
 fatalError("Invalid view model")
 }
 
 self.navigator = navigator
 self.viewModel = viewModel
 self.view = view
 super.init(viewModel: validViewModel)
 }
 
 // MARK: - ================================= Proxy action =================================
 override func start(viewModel: ViewModelRule) -> Observable<Void> {
 return proxyCoordinator()
 }
 }
 
 private extension AppRootCoordinatorImpl {
 func proxyCoordinator() -> Observable<Void> {
 let isValidApp = isValidApplication()
 if !isValidApp {
 return doneStory(params: nil)
 }
 
 return driverCoordinator()
 }
 
 // Driver
 func driverCoordinator() -> Observable<Void> {
 let storyCompletion = { [weak self] (_: Void) in
 guard let strongSelf = self else { return }
 strongSelf.driverCoordinator()
 .subscribe()
 .disposed(by: strongSelf.disposeBag)
 }
 
 // Goto intro for fist time install application
 let isFirstInstall = !UserDefaults.standard.bool(forKey: "INSTALLED_BEFORE")
 if isFirstInstall {
 UserDefaults.standard.set(true, forKey: "INSTALLED_BEFORE")
 return introStory(storyCompletion)
 }
 
 return oauthStory(storyCompletion)
 }
 
 // Stories
 func introStory(_ storyCompletion: @escaping (() -> Void)) -> Observable<Void> {
 return startIntroStory()
 .do(onNext: storyCompletion)
 }
 
 func oauthStory(_ storyCompletion: @escaping (() -> Void)) -> Observable<Void> {
 return startOauthStory()
 .do(onNext: storyCompletion)
 }
 
 // TODO: Check app for secure
 func isValidApplication() -> Bool {
 return true
 }
 
 func doneStory(params: Dictionary<String, Any>?) -> Observable<Void> {
 return didFinishStory(params: params)
 }
 
 // Finish story
 func didFinishStory(params: Dictionary<String, Any>? = nil) -> Observable<Void> {
 let rootVC = AppProvider.shared.navigationVC
 if let rootNav = rootVC {
 while rootNav.viewControllers.count > 0 {
 rootNav.viewControllers.removeLast()
 }
 }
 
 rootVC?.removeFromParent()
 return Observable.never()
 }
 }
 
 */



import SwiftUI
import RxSwift

/// Coordinator Out
/// Coordinator Identify
protocol RootCoordinator {
}

// ViewModel ===> Coordinator
protocol RootViewModelCoordSupport {
	var goHome: Observable<Void> { get }
}

// Implementation
class RootCoordinatorImpl: DefaultCoordinator<Void>, CoordinatorRule, RootCoordinator {
	typealias IndividualViewModel = RootViewModelCoordSupport
	let indViewModel: IndividualViewModel
	
	override init(view: AnyView?, viewModel: ViewModelRule?) {
		guard let indViewModel = viewModel as? IndividualViewModel else {
			fatalError("View model need to support coordinator")
		}
		
		self.indViewModel = indViewModel
		super.init(view: view, viewModel: viewModel)
	}
	
	override func doActionAfterMove(on viewModel: ViewModelRule?) -> Observable<Void> {
		guard let viewModel = viewModel, let indViewModel = viewModel as? IndividualViewModel else {
			fatalError("View model need to support coordinator")
		}
		
		// Login
		//		let home = viewModel.didForgotPassword
		//			.flatMap(bringMeToForgotPassword)
		//			.subscribe()
		let home = indViewModel.goHome
			.flatMap({ [weak self] _ in
				CoordMover(self).transitToHome()
			})
			.subscribe()
		
		return viewModel.didDone
			.take(1)
			.do(onNext: { _ in
				home.dispose()
			})
	}
}

