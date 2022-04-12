//
//  AppCommonProvider.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 09/04/2022.
//

import Swinject

class AppProvider {
	// MARK: - ================================= Properties =================================
	//+++ Singleton ============
	static let shared = AppProvider()
	private(set) var window: UIWindow?
	private(set) lazy var container = Container()
	private(set) var navigationVC: UINavigationController?

	private init() {}
	
	final func holdWindow(_ window: UIWindow?) {
		self.window = window
	}
	
//	final func holdDIContainer(_ container: Container) {
//		self.container = container
//	}
	
	final func setupSystem() {
		SystemConstructor(container: container).start()
	}
	
	final func resetNavigationVC() {
		self.navigationVC = NavigationUtil.navigation()
	}
	
	
//	private func construct(window: UIWindow?) {
//		WindowConstructor(container: container, window: window).start()
//	}
	
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

extension AppProvider {
	static var appDelegate: AppDelegateProvider {
		return DefaultAppDelegate()
	}
	
	static func appSceneDelegate() -> AppSceneDelegateProvider {
		return DefaultAppSceneDelegate()
	}
}

/// The way to fine navigation
///
///https://www.cuvenx.com/post/swiftui-pop-to-root-view
fileprivate struct NavigationUtil {
	static func popToRootView() {
		findNavigationController(viewController: UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController)?
			.popToRootViewController(animated: true)
	}
	
	static func navigation() -> UINavigationController? {
		return findNavigationController(viewController: UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController)
	}

	static func findNavigationController(viewController: UIViewController?) -> UINavigationController? {
		guard let viewController = viewController else {
			return nil
		}

		if let navigationController = viewController as? UINavigationController {
			return navigationController
		}

		for childViewController in viewController.children {
			return findNavigationController(viewController: childViewController)
		}

		return nil
	}
}
