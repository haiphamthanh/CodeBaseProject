//
//  AppRootCoordinator.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 26/07/2021.
//

import SwiftUI

class AppRootCoordinator: CoordinatorRule {
	typealias N = NavigationProvider
	let navigator: N
	init(navigator: NavigationProvider) {
		self.navigator = navigator
	}
	
	func gotoHome() {
		guard let view = homeView() else {
			return
		}
		
		navigator.pushView(view, animated: true)
	}
	
	func homeView() -> AnyView? {
		guard let view: HomeView<HomeViewModel> = homeViewConstructor() else {
			return nil
		}
		
		return AnyView(view)
	}
	
	func homeViewConstructor<VM>() -> HomeView<VM>? {
		let navigator = DefaultNavigation()
		let coordinator = HomeCoordinator(navigator: navigator)
		guard let homeViewModel = HomeViewModel(coordinator: coordinator) as? VM else {
			return nil
		}
		
		return HomeView<VM>(viewModel: homeViewModel)
	}
}

//extension AppRootCoordinator {
//	var navigator: Navigation? {
//		guard let window = self.currentWindow() else {
//			return nil
//		}
//
//		return Navigation(window: window)
//	}
//
//	private func currentWindow() -> UIWindow? {
//		let scene = UIApplication.shared.connectedScenes.first
//		guard let sd = scene?.delegate as? SceneDelegate else {
//			return nil
//		}
//
//		return sd.window
//	}
//}
