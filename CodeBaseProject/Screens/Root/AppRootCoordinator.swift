//
//  AppRootCoordinator.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 26/07/2021.
//

import SwiftUI

class AppRootCoordinator: CoordinatorRule {
	func gotoHome() {
		print("Go to home")
	}
	
//	func rootView() -> AnyView? {
//		guard let view: AppRootView<AppRootViewModel> = rootViewConstructor() else {
//			return nil
//		}
//		
//		return AnyView(view)
//	}
//	
//	func rootViewConstructor<VM>() -> AppRootView<VM>? {
//		let coordinator = AppRootCoordinator()
//		guard let rootViewModel = AppRootViewModel(coordinator: coordinator) as? VM else {
//			return nil
//		}
//		
//		return AppRootView<VM>(viewModel: rootViewModel)
//	}
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
