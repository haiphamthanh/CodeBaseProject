//
//  UIRegister.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 12/04/2022.
//

import Swinject

class UIRegister {
	// MARK: - ================================= Private Properties =================================
	private let container: Container
	
	// MARK: - ================================= Initialize =================================
	//+++ DependencyService =======
	init(container: Container) {
		self.container = container
	}
	
	func start() {
		return registerUserInterface()
	}
}

// MARK: - ================================= Register =================================
private extension UIRegister {
	func registerUserInterface() {
		//MARK: ------------------------------------ INTRODUCTION ------------------------------------
		container.register(IntroViewModel.self) { _ in IntroViewModelImpl() }
		container.register(IntroCoordinator.self) { r in
			guard let viewModel = r.sureResolve(IntroViewModel.self) as? ViewModelRule else {
				fatalError("View model need to confirm to ViewModelRule")
			}
			
			let view = ViewInstance.introView(viewModel: viewModel)
			return IntroCoordinatorImpl(view: view, viewModel: viewModel)
		}
		
		//MARK: ------------------------------------ ROOT ------------------------------------
		container.register(RootViewModel.self) { _ in RootViewModelImpl() }
		container.register(RootCoordinator.self) { r in
			guard let viewModel = r.sureResolve(RootViewModel.self) as? ViewModelRule else {
				fatalError("View model need to confirm to ViewModelRule")
			}
			
			let view = ViewInstance.rootView(viewModel: viewModel)
			return RootCoordinatorImpl(view: view, viewModel: viewModel)
		}
		
		//MARK: ------------------------------------ HOME ------------------------------------
		container.register(HomeViewModel.self) { _ in HomeViewModelImpl() }
		container.register(HomeCoordinator.self) { r in
			guard let viewModel = r.sureResolve(HomeViewModel.self) as? ViewModelRule else {
				fatalError("View model need to confirm to ViewModelRule")
			}
			
			let view = ViewInstance.homeView(viewModel: viewModel)
			return HomeCoordinatorImpl(view: view, viewModel: viewModel)
		}
		
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
	}
}
