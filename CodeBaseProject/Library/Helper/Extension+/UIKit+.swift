//
//  UIKit+.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 05/04/2022.
//

import UIKit

//extension UINavigationController: UIGestureRecognizerDelegate, UINavigationControllerDelegate {
//	override open func viewDidLoad() {
//		super.viewDidLoad()
//		interactivePopGestureRecognizer?.delegate = self
//		hidesBarsOnSwipe = true
//		delegate = self
//	}
//
//	public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
//		return false
//	}
//
//	public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
//		let item = BackBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
//		viewController.navigationItem.backBarButtonItem = item
//	}
//}

extension UINavigationController {
	func pushViewController(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void) {
		CATransaction.begin()
		CATransaction.setCompletionBlock(completion)
		pushViewController(viewController, animated: animated)
		CATransaction.commit()
	}
	
	func popViewController(animated: Bool = true, completion: @escaping () -> Void) {
		CATransaction.begin()
		CATransaction.setCompletionBlock(completion)
		popViewController(animated: animated)
		CATransaction.commit()
	}
	
	func popToRootViewController(animated: Bool = true, completion: @escaping () -> Void) {
		CATransaction.begin()
		CATransaction.setCompletionBlock(completion)
		popToRootViewController(animated: animated)
		CATransaction.commit()
	}
}
