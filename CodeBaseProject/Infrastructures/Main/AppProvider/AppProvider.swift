//
//  AppCommonProvider.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 09/04/2022.
//

import RxSwift
import Swinject
import SwiftUI
import os

class AppProvider {
	static let shared = AppProvider()
	private init() {}
	
	private(set) var window: UIWindow?
	private(set) lazy var container = Container()
	private var pNavigationVC: UINavigationController?
	private let disposeBag = DisposeBag()
}

// MARK: - ================================= Usage =================================
extension AppProvider {
	var navigationVC: UINavigationController? {
		if pNavigationVC == nil {
#if DEBUG
			print("\(#function) is called")
#endif
			pNavigationVC = findNavigationController(from: AppProvider.shared.window?.rootViewController)
		}
		
		return pNavigationVC
	}
	
	func holdWindow(_ window: UIWindow?) {
#if DEBUG
		print("\(#function) is called")
#endif
		self.pNavigationVC = nil
		self.window = window
		self.startAppStory()
	}
	
	func setupSystem() -> Bool {
#if DEBUG
		print("\(#function) is called")
#endif
		return SystemConstructor(container: container).start()
	}
	
	func makeWindowVisible(on view: AnyView, onNavigation: Bool = true) {
		window?.rootViewController = UIKitAdapter(rootView: view)
		window?.makeKeyAndVisible()
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
///// The way to find navigation
/////
/////https://www.cuvenx.com/post/swiftui-pop-to-root-view
private extension AppProvider {
	func startAppStory() {
		@Inject var appStory: AppStory
		return appStory
			.run()
			.subscribe()
			.disposed(by: disposeBag)
	}
	
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
