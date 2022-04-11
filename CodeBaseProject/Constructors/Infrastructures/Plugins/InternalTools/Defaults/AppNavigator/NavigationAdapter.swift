//
//  NavigationAdapter.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 11/04/2022.
//

import SwiftUI
///
/// This is navigator helper, don't use directly
/// Please use AppNavigator
///
///
/// Don't use this object directly
///

class NavigationAdapter: ObservableObject {
	private let window: UIWindow
	
	init(window: UIWindow) {
		self.window = window
	}
	
	var topViewController: UIViewController? {
		let first = window.rootViewController?.children.first
		if let nvc = first as? UINavigationController, let nav = nvc.navigationController {
			return nav
		}
		
		return first
	}
}

// Support SwiftUI only
extension NavigationAdapter {
	func pushView(_ view: AnyView, animated: Bool = true) {
		let controller = NavigationHostingController(rootView: view.environmentObject(self))
		pushViewController(controller, animated: animated)
	}
	
	func popToRoot(animated: Bool = true, completion: @escaping () -> Void) {
		popToRootViewController(animated: animated, completion: completion)
	}
	
	func popToRootAndPushToView(_ view: AnyView, animated: Bool = true) {
		popToRoot(animated: animated) {
			self.pushView(view, animated: animated)
		}
	}
	
	func popToPrevious(animated: Bool = true, completion: @escaping () -> Void) {
		popViewController(animated: animated, completion: completion)
	}
}

// Support SwiftUI and UIKit
extension NavigationAdapter {
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
	
	func present(viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
		let nvc = window.rootViewController?.children.first as? UINavigationController
		nvc?.present(viewController, animated: animated, completion: completion)
	}
	
	func dismiss(animated: Bool, completion: (() -> Void)?) {
		let nvc = window.rootViewController?.children.first as? UINavigationController
		nvc?.dismiss(animated: animated, completion: completion)
	}
}
