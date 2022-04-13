//
//  AppCommonProvider.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 09/04/2022.
//

import Swinject
import os

class AppProvider {
	// MARK: - ================================= Properties =================================
	//+++ Singleton ============
	static let shared = AppProvider()
	private init() {}
	private var needResetNavigation = true
	private var pNavigationVC: UINavigationController?
	
	private(set) var window: UIWindow?
	private(set) lazy var container = Container()
}

// MARK: - ================================= Usage =================================
extension AppProvider {
	var navigationVC: UINavigationController? {
		if needResetNavigation {
#if DEBUG
			print("\(#function) is called")
#endif
			pNavigationVC = findNavigationController(from: AppProvider.shared.window?.rootViewController)
			needResetNavigation = false
		}
		
		return pNavigationVC
	}
	
	func holdWindow(_ window: UIWindow?) {
#if DEBUG
			print("\(#function) is called")
#endif
		self.window = window
		self.needResetNavigation = true
	}
	
	func setupSystem() {
	#if DEBUG
				print("\(#function) is called")
	#endif
		SystemConstructor(container: container).start()
	}
	
	///
	/// Use for make root by UINavigationController
	///
//	final var rootVCFromScene: UINavigationController? {
//		guard let scene = UIApplication.shared.connectedScenes.first,
//			  let sceneDelegate = scene as? UIWindowScene,
//			  let rootvc = sceneDelegate.windows.first?.rootViewController
//				as? UINavigationController else { return nil }
		
//		guard let rootvc = window?.rootViewController
//				as? UINavigationController else { return nil }
//
//		return rootvc
//	}
}

// MARK: - ================================= Private =================================
private extension AppProvider {
	func findNavigationController(from rootVC: UIViewController?) -> UINavigationController? {
		guard let rootVC = rootVC else {
			return nil
		}

		if let navigationController = rootVC as? UINavigationController {
			return navigationController
		}

		for childViewController in rootVC.children {
			return findNavigationController(from: childViewController)
		}

		return nil
	}
}

// MARK: - ================================= System (Need to refactor later) =================================
extension AppProvider {
	static var appDelegate: AppDelegateProvider {
		return DefaultAppDelegate()
	}
	
	static func appSceneDelegate() -> AppSceneDelegateProvider {
		return DefaultAppSceneDelegate()
	}
}

///// The way to fine navigation
/////
/////https://www.cuvenx.com/post/swiftui-pop-to-root-view
//fileprivate struct NavigationUtil {
////	static func popToRootView() {
////		findNavigationController(viewController: UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController)?
////			.popToRootViewController(animated: true)
////	}
//
//	static func navigation() -> UINavigationController? {
//		if !AppProvider.shared.needUpdateNavigation {
//			return AppProvider.shared.navigationVC
//		}
//
//		#if DEBUG
//		print("\(#function) is called")
//		#endif
//
////		UIApplication.shared.windows.filter { $0.isKeyWindow }.first ??
//		AppProvider.shared.needUpdateNavigation = false
//		return findNavigationController(viewController: AppProvider.shared.window?.rootViewController)
//	}
//
//	static func findNavigationController(viewController: UIViewController?) -> UINavigationController? {
//		guard let viewController = viewController else {
//			return nil
//		}
//
//		if let navigationController = viewController as? UINavigationController {
//			return navigationController
//		}
//
//		for childViewController in viewController.children {
//			return findNavigationController(viewController: childViewController)
//		}
//
//		return nil
//	}
//}
