//
//  GKAnimationManager.swift
//  ASHManager
//
//  Created by TienNT12 on 2/6/18.
//  Copyright © 2018 Asahi. All rights reserved.
//

import UIKit

enum AnimationManagerKey: String {
	case opacity = "opacity"
	case strokeEnd = "strokeEnd"
	case transform = "transform"
	case path = "path"
	case reveal = "reveal"
}

class AnimationManager {
	class func opacityAnimation(reverse: Bool) -> CABasicAnimation {
		let animation = CABasicAnimation(keyPath: AnimationManagerKey.opacity.rawValue)
		if (reverse) {
			animation.fromValue = 1.0
			animation.toValue = 0.0
		} else {
			animation.fromValue = 0.0
			animation.toValue = 1.0
		}
		animation.duration = 1.0
		animation.isRemovedOnCompletion = false
		animation.fillMode = .forwards
		animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
		return animation
	}
	
	class func strokeAnimation(reverse: Bool) -> CABasicAnimation {
		let animation = CABasicAnimation(keyPath: AnimationManagerKey.strokeEnd.rawValue)
		if (reverse) {
			animation.fromValue = 1.0
			animation.toValue = 0.0
		} else {
			animation.fromValue = 0.0
			animation.toValue = 1.0
		}
		
		animation.duration = 1.0
		animation.isRemovedOnCompletion = false
		animation.fillMode = .forwards
		animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
		return animation
	}
	
	class func transformAnimation(reverse: Bool) -> CAKeyframeAnimation {
		let values = NSMutableArray()
		let keyTimes = NSMutableArray()
		let amplitude = 0.30
		
		if (reverse) {
			values.addObjects(from: [CATransform3DMakeScale(1, 1, 1)])
		} else {
			values.addObjects(from: [CATransform3DMakeScale(0.2, 0.2, 0.2)])
		}
		
		keyTimes.add(0.0)
		
		for i in 1...1 {
			let scale = (i % 2) == 1 ? (1 + amplitude / Double(i)) : (1 - amplitude / Double(i))
			let time = Double(i) * 1.0 / (amplitude + 1)
			values.addObjects(from: [CATransform3DMakeScale(CGFloat(scale), CGFloat(scale), CGFloat(scale))])
			keyTimes.add(time)
		}
		
		if (reverse) {
			values.addObjects(from: [CATransform3DMakeScale(0.0001, 0.0001, 0.0001)])
		} else {
			values.addObjects(from: [CATransform3DMakeScale(1, 1, 1)])
		}
		
		keyTimes.add(1.0)
		
		let animation = CAKeyframeAnimation(keyPath: AnimationManagerKey.transform.rawValue)
		animation.values = values as? [Any]
		animation.keyTimes = keyTimes as? [NSNumber]
		animation.duration = 0.5
		animation.isRemovedOnCompletion = false
		animation.fillMode = .forwards
		animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
		return animation
	}
	
	class func circularRevealAnimation(layer: CALayer, center: CGPoint, startRadius: CGFloat, endRadius: CGFloat,
									   duration: TimeInterval, timingFunction: CAMediaTimingFunction, completion: (() -> Void)?) -> CircularRevealAnimator {
		let animator = CircularRevealAnimator(layer: layer, center: center, startRadius: startRadius, endRadius: endRadius)
		animator.timingFunction = CAMediaTimingFunction(name: .easeIn)
		animator.duration = duration
		animator.completion = completion
		
		return animator
	}
}
