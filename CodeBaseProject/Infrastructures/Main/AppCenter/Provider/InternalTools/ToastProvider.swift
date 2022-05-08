//
//  ToastProvider.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 09/04/2022.
//

import UIKit

enum MyToastPosition {
	case top
	case left
	case right
	case bottom
	case center
}

protocol ToastProvider {
	// MARK: - ================================= Usage =================================
	func show(message: String)
	func show(message: String, position: MyToastPosition)
	func makeToastActivity(_ position: MyToastPosition)
	func makeToastActivity(_ point: CGPoint)
}
