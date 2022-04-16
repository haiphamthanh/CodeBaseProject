//
//  UIToolsRegister.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 09/04/2022.
//

import Swinject

class UIToolsRegister {
	// MARK: - ================================= Private Properties =================================
	private let container: Container
	
	// MARK: - ================================= Initialize =================================
	//+++ DependencyService =======
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
		container.register(RepoProvider.self) { r in
			let networkProvider = r.sureResolve(NetworkProvider.self)
			let localProvider = r.sureResolve(LocalProvider.self)
			return RepoProviderImpl(networkProvider, localProvider)
		}
		container.register(UseCaseProvider.self) { r in
			let repoProvider = r.sureResolve(RepoProvider.self)
			return UseCaseProviderImpl(repoProvider)
		}
		container.register(UseCases.self) { r in
			let useCaseProvider = r.sureResolve(UseCaseProvider.self)
			return UseCasesImpl(usecaseProvider: useCaseProvider)
		}
	}
	
	func registerUtilTools() {
		container.register(AlertProvider.self) { r in
			let navigation = r.sureResolve(NavigationProvider.self)
			return DefaultAlert(navigation: navigation)
		}
		
		container.register(ToastProvider.self) { r in
			let navigation = r.sureResolve(NavigationProvider.self)
			return DefaultToast(navigation: navigation)
		}
		
		container.register(ImageProvider.self) { _ in DefaultImage() }
	}
}
