//
//  BasicNavigationServiceProtocol.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 09/04/2022.
//

import UIKit

protocol NavigationServiceProtocol {
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

protocol BasicNavigationServiceProtocol: NavigationServiceProtocol {
	func setup(with nav: UINavigationController)
}

class BasicNavigationService: BasicNavigationServiceProtocol {
	// MARK: Initialization
	required init() {
		self.navigationController = UINavigationController()
	}
	
	convenience init(from window: UIWindow?) {
		self.init()
		
		guard let nav = window?.rootViewController as? CustomizeNavigation else {
			return
		}
		
		self.setup(with: nav)
	}
	
	// MARK: Properties
	
	var visibleViewController: UIViewController? {
		return self.topNavigationController.visibleViewController
	}
	
	var topViewController: UIViewController? {
		get {
			var viewController: UIViewController = self.navigationController
			while viewController.presentedViewController != nil {
				viewController = viewController.presentedViewController!
			}
			
			if viewController.isKind(of: UINavigationController.self) {
				if let vc = (viewController as! UINavigationController).topViewController {
					viewController = vc
				}
			}
			return viewController
		}
	}
	
	var viewControllers: [UIViewController] {
		return topNavigationController.viewControllers
	}
	var selectedNavigationController: UINavigationController {
		return self.navigationController
	}
	var containerViewController: UIViewController {
		return self.navigationController
	}
	
	private var navigationController: UINavigationController
	private var topNavigationController: UINavigationController {
		get {
			var viewController = self.navigationController
			while viewController.presentedViewController != nil && (viewController.presentedViewController?.isKind(of: UINavigationController.self))! {
				viewController = viewController.presentedViewController as! UINavigationController
			}
			return viewController
		}
	}
	
	// MARK: BasicNavigationService
	
	func setup(with nav: UINavigationController) {
		self.navigationController = nav
	}
	
	// MARK: NavigationService
	
	func resetStack(by viewControllers: [UIViewController], animated: Bool) {
		self.topNavigationController.setViewControllers(viewControllers, animated: animated)
	}
	
	func push(viewController: UIViewController, animated: Bool) {
		self.topNavigationController.pushViewController(viewController, animated: animated)
	}
	
	func pop(animated: Bool) {
		self.topNavigationController.popViewController(animated: animated)
	}
	
	func pop(to viewController: UIViewController, animated: Bool) {
		self.topNavigationController.popToViewController(viewController, animated: animated)
	}
	
	func pop<T: UIViewController>(to type: T.Type, animated: Bool) {
		self.topNavigationController.popToViewControllerOfType(vcType: type, animated: animated)
	}
	
	func popToRoot(animated: Bool) {
		self.topNavigationController.popToRootViewController(animated: animated)
	}
	
	// MARK:
	
	func present(viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
		self.topViewController!.present(viewController, animated: animated, completion: completion)
	}
	
	func dismiss(animated: Bool, completion: (() -> Void)?) {
		self.topViewController!.dismiss(animated: animated, completion: completion)
	}
	
	// MARK:
	
	func show(viewController: UIViewController, sender: AnyObject?) {
		self.topNavigationController.show(viewController, sender: sender)
	}
	
	func showDetail(viewController: UIViewController, sender: AnyObject?) {
		self.topNavigationController.showDetailViewController(viewController, sender: sender)
	}
}

extension UINavigationController {
	// Pop to the VC of the given class
	// If not found, pop to root
	func popToViewControllerOfType<T: UIViewController>(vcType: T.Type, animated: Bool) {
		let vcArr = self.viewControllers
		for vc in vcArr as Array<AnyObject> {
			if vc is T {
				self.popToViewController(vc as! UIViewController, animated: true)
				return
			}
		}
		
		popToRootViewController(animated: true)
	}
}

