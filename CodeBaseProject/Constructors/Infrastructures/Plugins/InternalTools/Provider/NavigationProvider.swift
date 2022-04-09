//
//  NavigationProvider.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 09/04/2022.
//

import UIKit

protocol NavigationProvider {
	// MARK: Properties
	// The visible view controller is either the top of the navigation stack or a view controller
	// being presented modally by it.
	var visibleViewController: UIViewController? { get }
	// The view controller at the top of the navigation stack.
	var topViewController: UIViewController? { get }
	// The view controllers in the selected navigation controller's stack.
	var viewControllers: [UIViewController] { get }
	// The currently selected navigation controller. (There may only be one.)
	var selectedNavigationController: UINavigationController { get }
	// The container view controller housing all of the other view controllers.
	var containerViewController: UIViewController { get }
	
	// MARK: General
	func show(viewController: UIViewController, sender: AnyObject?)
	func showDetail(viewController: UIViewController, sender: AnyObject?)
	
	// MARK: Stack
	// Sets the view controllers on the selected navigation controller's stack.
	func resetStack(by viewControllers: [UIViewController], animated: Bool)
	func push(viewController: UIViewController, animated: Bool)
	// Pops the top view controller from the selected navigation controller's stack.
	func pop(animated: Bool)
	func pop(to viewController: UIViewController, animated: Bool)
	func pop<T: UIViewController>(to type: T.Type, animated: Bool)
	func popToRoot(animated: Bool)
	
	// MARK: Modal
	func present(viewController: UIViewController, animated: Bool, completion: (() -> Void)?)
	func dismiss(animated: Bool, completion: (() -> Void)?)
}
