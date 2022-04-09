//
//  ToastServiceProtocol.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 09/04/2022.
//

import Foundation

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

protocol ToastServiceProtocol {
	// MARK: - ================================= Usage =================================
	func show(message: String)
	func show(message: String, type: ToastType)
	func show(message: String, type: ToastType, position: ToastPosition)
}

import Toast_Swift

class BaseToastService {
	private let navigationService: BasicNavigationServiceProtocol
	init(navigationService: BasicNavigationServiceProtocol) {
		self.navigationService = navigationService
	}
}

extension BaseToastService: ToastServiceProtocol {
	// MARK: - ================================= Usage =================================
	func show(message: String) {
		if let nav = self.navigationService.topViewController?.navigationController {
			nav.view.makeToast(message)
			return
		}
		
		self.navigationService.topViewController?.view.makeToast(message)
	}
	
	func show(message: String, type: ToastType) {
		// TODO: implement later
	}
	
	func show(message: String, type: ToastType, position: ToastPosition) {
		// TODO: implement later
	}
}
