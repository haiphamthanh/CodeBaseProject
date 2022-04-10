//
//  SwinjectSetting.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 09/04/2022.
//

import Swinject

// MARK: - ================================= All Service is provided =================================
class SwinjectSetting {
	// MARK: - ================================= Private Properties =================================
	private let container: Container
	private let window: UIWindow
	
	// MARK: - ================================= Initialize =================================
	//+++ DependencyService =======
	init(container: Container, window: UIWindow) {
		self.container = container
		self.window = window
	}
	
	func startSettingUp() {
		// 1.
		registerPrimaryTools()
		// 2.
		registerUtilTools()
		// 3.
//		registerUserInterface()
	}
}

// MARK: - ================================= Register =================================
private extension SwinjectSetting {
	func registerPrimaryTools() {
		container.register(NavigationProvider.self) { [weak self] _ in
			DefaultNavigation(from: self?.window)
		}
	}
	
//	let networkProvider = NetProvider()
//	let useCaseProvider = NetUseCaseProvider(networkProvider)
//	let networkService = NetworkService(usecaseProvider: useCaseProvider)
//
//	let result = await networkService.user.userInfo(inputUrl: UrlInputUserInfo(userId: "123", gender: nil))
	
	func registerUtilTools() {
//		container.register(NetUseCaseProvider.self) { _ in NetUseCaseProvider() }
//		container.register(NetUseCaseProvider.self) { r in
//			let useCaseProvider = r.sureResolve(NetUseCaseProvider.self)
//			return NetworkService(usecaseProvider: useCaseProvider)
//		}
//		container.register(NetworkServiceProtocol.self) { r in
//			let useCaseProvider = r.sureResolve(NetUseCaseProvider.self)
//			return NetworkService(usecaseProvider: useCaseProvider)
//		}
		
//		container.register(DataStoreUseCaseProviderProtocol.self) { _ in DataStoreUseCaseProvider() }
//		container.register(DataStoreServiceProtocol.self) { r in
//			let useCaseProvider = r.sureResolve(DataStoreUseCaseProviderProtocol.self)
//			return DataStoreService(useCaseProvider: useCaseProvider)
//		}
		
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
	
//	func registerUserInterface() {
//		//MARK: ------------------------------------ APPLICATION ------------------------------------
//		container.register(AppCoordinatorProtocol.self) { _ in BaseAppCoordinator() }
//
//		//MARK: ------------------------------------ AUTHENTICATION ------------------------------------
//		container.register(AuthModelProtocol.self) { _ in AuthModel() }
//		container.register(AuthViewModelProtocol.self) { r in
//			let model = r.sureResolve(AuthModelProtocol.self)
//
//			// Config for network
//			let network = r.sureResolve(NetworkServiceProtocol.self)
//			let dataStore = r.sureResolve(DataStoreServiceProtocol.self)
//			let viewModel = AuthViewModel(model: model,
//										  network: network,
//										  dataStore: dataStore)
//
//			return viewModel
//		}
//		container.register(AuthViewProtocol.self) { _ in AuthViewController.newInstance() }
//		container.register(AuthCoordinatorProtocol.self) { r in
//			let view = r.sureResolve(AuthViewProtocol.self)
//			let viewModel = r.sureResolve(AuthViewModelProtocol.self)
//			let coordinator = AuthCoordinator()
//
//			return r.promiseCoordinator(view: view, viewModel: viewModel, coordinator: coordinator)
//		}
//
//		//MARK: ------------------------------------ HOME ------------------------------------
//		container.register(HomeModelProtocol.self) { _ in HomeModel() }
//		container.register(HomeViewModelProtocol.self) { r in
//			let model = r.sureResolve(HomeModelProtocol.self)
//
//			// Config for network
//			let network = r.sureResolve(NetworkServiceProtocol.self)
//			let dataStore = r.sureResolve(DataStoreServiceProtocol.self)
//			let viewModel = HomeViewModel(model: model,
//										  network: network,
//										  dataStore: dataStore)
//
//			return viewModel
//		}
//		container.register(HomeViewProtocol.self) { _ in HomeViewController.newInstance() }
//		container.register(HomeCoordinatorProtocol.self) { r in
//			let view = r.sureResolve(HomeViewProtocol.self)
//			let viewModel = r.sureResolve(HomeViewModelProtocol.self)
//			let coordinator = HomeCoordinator()
//
//			return r.promiseCoordinator(view: view, viewModel: viewModel, coordinator: coordinator, window: window)
//		}
//	}
}
