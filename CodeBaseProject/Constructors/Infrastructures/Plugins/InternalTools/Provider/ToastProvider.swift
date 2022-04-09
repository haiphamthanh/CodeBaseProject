//
//  ToastProvider.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 09/04/2022.
//

import UIKit

enum ToastPosition {
	case top
	case left
	case right
	case bottom
	case center
}

enum ToastType {
	case normal
}

protocol ToastProvider {
	// MARK: - ================================= Usage =================================
	func show(message: String)
	func show(message: String, type: ToastType)
	func show(message: String, type: ToastType, position: ToastPosition)
}
