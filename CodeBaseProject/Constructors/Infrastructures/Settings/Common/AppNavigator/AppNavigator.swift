//
//  AppNavigator.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 11/04/2022.
//

import SwiftUI

class AppNavigator: AppNavigatorProvider {
	private var navigator: NavigationAdapter? {
		guard let window = AppProvider.shared.window else {
			return nil
		}
		
		return NavigationAdapter(window: window)
	}
}

// Support SwiftUI only
extension AppNavigator {
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
}

// Support SwiftUI and UIKit
extension AppNavigator {
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
}
