//
//  DefaultToast.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 09/04/2022.
//

import Toast_Swift

class DefaultToast {
	private let navigation: NavigationProvider
	init(navigation: NavigationProvider) {
		self.navigation = navigation
	}
}

extension DefaultToast: ToastProvider {
	// MARK: - ================================= Usage =================================
	func show(message: String) {
		self.navigation.topVC?.view.makeToast(message)
	}
	
	func show(message: String, type: ToastType) {
		// TODO: implement later
	}
	
	func show(message: String, type: ToastType, position: ToastPosition) {
		// TODO: implement later
	}
}
