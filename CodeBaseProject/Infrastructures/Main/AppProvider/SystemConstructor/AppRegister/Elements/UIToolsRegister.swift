//
//  UIToolsRegister.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 09/04/2022.
//

import Swinject

class UIToolsRegister {
	private weak var container: Container!
	init(_ container: Container) {
		self.container = container
	}
	
	func start() {
		registerPrimaryTools()
		registerUtilTools()
	}
}

private extension UIToolsRegister {
	func registerPrimaryTools() {
		// Navigation
		container.register(NavigationProvider.self) { r in DefaultNavigation() }
	}
	
	func registerUtilTools() {
		container.register(AlertProvider.self) { _ in DefaultAlert() }
		container.register(ToastProvider.self) { _ in DefaultToast() }
		container.register(ImageProvider.self) { _ in DefaultImage() }
	}
}
