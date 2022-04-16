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
//	private var window: UIWindow? {
//		AppProvider.shared.window
//	}
//	private var navigationVC: UINavigationController? {
//		AppProvider.shared.navigationVC
//	}
	
	private let window: UIWindow?
	private var navigationVC: UINavigationController?
	init(window: UIWindow?, navigationVC: UINavigationController?) {
		self.window = window
		self.navigationVC = navigationVC
	}
	
	var topVC: UIViewController? {
		let first = window?.rootViewController?.children.first
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
	
	func resetStack<Content:View>(by views: [Content], animated:Bool) {
		let controllers =  views.compactMap { UIHostingController(rootView: $0) }
		resetStack(by: controllers, animated: animated)
	}
}

// Support SwiftUI and UIKit
extension NavigationAdapter {
	func pushViewController(_ viewController: UIViewController, animated: Bool = true) {
		navigationVC?.pushViewController(viewController, animated: animated)
	}
	
	func popToRootViewController(animated: Bool = true, completion: @escaping () -> Void) {
		navigationVC?.popToRootViewController(animated: animated, completion: completion)
	}
	
	func popViewController(animated: Bool = true, completion: @escaping () -> Void) {
		navigationVC?.popViewController(animated: animated, completion: completion)
	}
	
	func switchRootViewController(rootViewController: UIViewController, animated: Bool = true, completion: (() -> Void)?) {
		guard let window = window else { return }
		
		if !animated {
			return window.rootViewController = rootViewController
		}
		
		UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: {
			let oldState: Bool = UIView.areAnimationsEnabled
			UIView.setAnimationsEnabled(false)
			window.rootViewController = rootViewController
			UIView.setAnimationsEnabled(oldState)
		}, completion: { (finished: Bool) -> () in
			if (completion != nil) {
				completion!()
			}
		})
	}
	
	func resetStack(by vcs: [UIViewController], animated: Bool = true) {
		navigationVC?.setViewControllers(vcs, animated: animated)
	}
	
	func present(viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
		navigationVC?.present(viewController, animated: animated, completion: completion)
	}
	
	func dismiss(animated: Bool, completion: (() -> Void)?) {
		navigationVC?.dismiss(animated: animated, completion: completion)
	}
}
