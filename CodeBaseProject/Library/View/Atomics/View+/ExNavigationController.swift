//
//  ExNavigationController.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 09/04/2022.
//

import UIKit

enum NavigationAnimation {
	case circularReveal(point: CGPoint?)
	
	func animation() -> UIViewControllerAnimatedTransitioning? {
		switch self {
		case .circularReveal(let point):
			guard let point = point else {
				return nil
			}
			
			return CircularRevealTransitionAnimator(center: point)
		}
	}
}

class ExNavigationController: UINavigationController {
	fileprivate var transitionPoint: CGPoint?
	var navigationAnimation: NavigationAnimation {
		return .circularReveal(point: transitionPoint)
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		delegate = self
	}
	
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		
		delegate = self
	}
	
	override init(rootViewController: UIViewController) {
		super.init(rootViewController: rootViewController)
		
		delegate = self
	}
}

extension ExNavigationController {
	func shouldAnimation(at point: CGPoint) {
		transitionPoint = point
	}
}

extension ExNavigationController: UINavigationControllerDelegate {
	public func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		return navigationAnimation.animation()
	}
}
