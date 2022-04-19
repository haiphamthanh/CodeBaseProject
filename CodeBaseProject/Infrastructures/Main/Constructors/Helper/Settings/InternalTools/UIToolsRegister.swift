//
//  UIToolsRegister.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 09/04/2022.
//

import Swinject

class UIToolsRegister {
	private let container: Container
	init(container: Container) {
		self.container = container
	}
	
	func start() {
		// 1.
		registerPrimaryTools()
		// 2.
		registerUtilTools()
	}
}

// MARK: - ================================= Register =================================
private extension UIToolsRegister {
	func registerPrimaryTools() {
		// Navigation
		container.register(NavigationProvider.self) { r in DefaultNavigation() }
		
		// Network
		container.register(NetworkProvider.self) { _ in NetworkProviderImpl() }
		container.register(LocalProvider.self) { _ in LocalProviderImpl() }
		
		// Repository
		container.register(RepoProvider.self) { r in return RepoProviderImpl() }
		
		// Usecase
		container.register(UseCaseProvider.self) { _ in UseCaseProviderImpl() }
		container.register(UseCases.self) { _ in UseCasesImpl() }
	}
	
	func registerUtilTools() {
		container.register(AlertProvider.self) { _ in DefaultAlert() }
		container.register(ToastProvider.self) { _ in DefaultToast() }
		container.register(ImageProvider.self) { _ in DefaultImage() }
	}
}
