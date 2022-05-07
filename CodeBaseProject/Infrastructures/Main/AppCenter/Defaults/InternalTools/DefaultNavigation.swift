//
//  DefaultNavigation.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 11/04/2022.
//

import SwiftUI

class DefaultNavigation: NavigationProvider {
	private let navigator: NavigationAdapter?
	init() {
		let window = AppCenter.shared.window
		let navigationVC = AppCenter.shared.navigationVC
		self.navigator = NavigationAdapter(window: window, navigationVC: navigationVC)
	}
}

// Support SwiftUI only
extension DefaultNavigation {
	func pushView(_ view: AnyView, animated: Bool) {
		navigator?.pushView(view, animated: animated)
	}
	
	func popToRoot(animated: Bool, completion: @escaping () -> Void) {
		navigator?.popToRoot(animated: animated, completion: completion)
	}
	
	func popToRootAndPushToView(_ view: AnyView, animated: Bool) {
		navigator?.popToRootAndPushToView(view, animated: animated)
	}
	
	func popToPrevious(animated: Bool, completion: @escaping () -> Void) {
		navigator?.popToPrevious(animated: animated, completion: completion)
	}
	
	func resetStack<Content:View>(by views:[Content], animated:Bool) {
		navigator?.resetStack(by: views, animated: animated)
	}
}

// Support SwiftUI and UIKit
extension DefaultNavigation {
	var topVC: UIViewController? {
		return navigator?.topVC
	}
	
	func pushViewController(_ viewController: UIViewController, animated: Bool) {
		navigator?.pushViewController(viewController, animated: animated)
	}
	
	func popToRootViewController(animated: Bool, completion: @escaping () -> Void) {
		navigator?.popToRootViewController(animated: animated, completion: completion)
	}
	
	func popViewController(animated: Bool, completion: @escaping () -> Void) {
		navigator?.popViewController(animated: animated, completion: completion)
	}
	
	func switchRootViewController(rootViewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
		navigator?.switchRootViewController(rootViewController: rootViewController, animated: animated, completion: completion)
	}
	
	func resetStack(by vcs: [UIViewController], animated: Bool) {
		navigator?.resetStack(by: vcs, animated: animated)
	}
	
	// MARK: Modal
	func present(_ view: AnyView, animated: Bool, completion: (() -> Void)?) {
		navigator?.present(view, animated: animated, completion: completion)
	}
	
	func present(viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
		navigator?.present(viewController: viewController, animated: animated, completion: completion)
	}
	
	func dismiss(animated: Bool, completion: (() -> Void)?) {
		navigator?.dismiss(animated: animated, completion: completion)
	}
}
