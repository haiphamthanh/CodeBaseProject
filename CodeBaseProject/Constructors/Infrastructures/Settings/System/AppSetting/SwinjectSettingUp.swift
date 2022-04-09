//
//  SwinjectSettingUp.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 09/04/2022.
//

import Swinject

// MARK: - ================================= All Service is provided =================================
class BaseRegisterApp {
	// MARK: - ================================= Private Properties =================================
	private weak var container: Container!
	private weak var window: UIWindow!
	
	// MARK: - ================================= Initialize =================================
	//+++ DependencyService =======
	init(container: Container, window: UIWindow) {
		self.container = container
		self.window = window
		
		// Register
		self.registerTo(container: container, window: window)
	}
	
	// MARK: - ================================= Register =================================
	func registerMainServiceTo(container: Container, window: UIWindow) {
		container.register(BasicNavigationServiceProtocol.self) { _ in
			return BasicNavigationService.init(from: window)
		}
	}
	
	func registerUsageServiceTo(container: Container) {
		container.register(NetUseCaseProviderProtocol.self) { _ in NetUseCaseProvider() }
		container.register(NetworkServiceProtocol.self) { r in
			let useCaseProvider = r.sureResolve(NetUseCaseProviderProtocol.self)
			return NetworkService(useCaseProvider: useCaseProvider)
		}
		
//		container.register(DataStoreUseCaseProviderProtocol.self) { _ in DataStoreUseCaseProvider() }
//		container.register(DataStoreServiceProtocol.self) { r in
//			let useCaseProvider = r.sureResolve(DataStoreUseCaseProviderProtocol.self)
//			return DataStoreService(useCaseProvider: useCaseProvider)
//		}
		
		container.register(AlertServiceProtocol.self) { r in
			let navService = r.sureResolve(BasicNavigationServiceProtocol.self)
			return AlertService(navigationService: navService)
		}
		container.register(ToastServiceProtocol.self) { r in
			let navService = r.sureResolve(BasicNavigationServiceProtocol.self)
			return BaseToastService(navigationService: navService)
		}
		container.register(ImageServiceProtocol.self) { _ in BaseImageService() }
	}
	
//	func registerGUITo(container: Container, window: UIWindow) {
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

// MARK: - ================================= Private =================================
private extension BaseRegisterApp {
	func registerTo(container: Container, window: UIWindow) {
		registerMainServiceTo(container: container, window: window)
		registerUsageServiceTo(container: container)
		registerGUITo(container: container, window: window)
	}
}
