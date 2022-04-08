//
//  RegistationManager.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 08/04/2022.
//
//	# Dependency injection pod 'Swinject'

import Foundation

//class RegisterApp: BaseRegisterApp {
//	// MARK: - ================================= Customizations =================================
//	override func registerGUITo(container: Container, window: UIWindow) {
//		super.registerGUITo(container: container, window: window)
//
//		//MARK: ------------------------------------ REGISTER ------------------------------------
//		// Driver
//		container.register(RegisterCoordinatorProtocol.self) { _ in RegisterCoordinator() }
//
//		// User Info Registration
//		container.register(AccountRegisterModelProtocol.self) { _ in AccountRegisterModel() }
//		container.register(AccountRegisterViewModelProtocol.self) { r in
//			let model = r.sureResolve(AccountRegisterModelProtocol.self)
//
//			// Config for network
//			let network = r.sureResolve(NetworkServiceProtocol.self)
//			let dataStore = r.sureResolve(DataStoreServiceProtocol.self)
//			let viewModel = AccountRegisterViewModel(model: model,
//													 network: network,
//													 dataStore: dataStore)
//
//			return viewModel
//		}
//		container.register(AccountRegisterViewProtocol.self) { _ in AccountRegisterViewController.newInstance() }
//		container.register(AccountRegisterCoordinatorProtocol.self) { r in
//			let view = r.sureResolve(AccountRegisterViewProtocol.self)
//			let viewModel = r.sureResolve(AccountRegisterViewModelProtocol.self)
//			let coordinator = AccountRegisterCoordinator()
//
//			return r.promiseCoordinator(view: view, viewModel: viewModel, coordinator: coordinator, window: window)
//		}
//
//		//MARK: ------------------------------------ INTRODUCTION ------------------------------------
//		container.register(IntroModelProtocol.self) { _ in IntroModel() }
//		container.register(IntroViewModelProtocol.self) { r in
//			let model = r.sureResolve(IntroModelProtocol.self)
//
//			// Config for network
//			let network = r.sureResolve(NetworkServiceProtocol.self)
//			let dataStore = r.sureResolve(DataStoreServiceProtocol.self)
//			let viewModel = IntroViewModel(model: model,
//										   network: network,
//										   dataStore: dataStore)
//
//			return viewModel
//		}
//		container.register(IntroViewProtocol.self) { _ in IntroViewController.newInstance() }
//		container.register(IntroCoordinatorProtocol.self) { r in
//			let view = r.sureResolve(IntroViewProtocol.self)
//			let viewModel = r.sureResolve(IntroViewModelProtocol.self)
//			let coordinator = IntroCoordinator()
//
//			return r.promiseCoordinator(view: view, viewModel: viewModel, coordinator: coordinator, window: window)
//		}
//
//		//MARK: ------------------------------------ AUTHENTICATION ------------------------------------
//		container.register(AuthModelProtocol.self) { _ in ASEAuthModel() }
//		container.register(AuthViewModelProtocol.self) { r in
//			let model = r.sureResolve(AuthModelProtocol.self)
//
//			// Config for network
//			let network = r.sureResolve(NetworkServiceProtocol.self)
//			let dataStore = r.sureResolve(DataStoreServiceProtocol.self)
//			let viewModel = ASEAuthViewModel(model: model,
//											 network: network,
//											 dataStore: dataStore)
//
//			return viewModel
//		}
//		container.register(AuthViewProtocol.self) { _ in ASEAuthViewController.newInstance() }
//		container.register(AuthCoordinatorProtocol.self) { r in
//			let view = r.sureResolve(AuthViewProtocol.self)
//			let viewModel = r.sureResolve(AuthViewModelProtocol.self)
//			let coordinator = ASEAuthCoordinator()
//
//			return r.promiseCoordinator(view: view, viewModel: viewModel, coordinator: coordinator, window: window)
//		}
//
//		//MARK: #################### TERM_OF_USE ####################
//		container.register(TermOfUseModelProtocol.self) { _ in TermOfUseModel() }
//		container.register(TermOfUseViewModelProtocol.self) { r in
//			let model = r.sureResolve(TermOfUseModelProtocol.self)
//
//			// Config for network
//			let network = r.sureResolve(NetworkServiceProtocol.self)
//			let dataStore = r.sureResolve(DataStoreServiceProtocol.self)
//			let viewModel = TermOfUseViewModel(model: model,
//											   network: network,
//											   dataStore: dataStore)
//
//			return viewModel
//		}
//		container.register(TermOfUseViewProtocol.self) { _ in TermOfUseViewController.newInstance() }
//		container.register(TermOfUseCoordinatorProtocol.self) { r in
//			let view = r.sureResolve(TermOfUseViewProtocol.self)
//			let viewModel = r.sureResolve(TermOfUseViewModelProtocol.self)
//			let coordinator = TermOfUseCoordinator()
//
//			return r.promiseCoordinator(view: view, viewModel: viewModel, coordinator: coordinator)
//		}
//
//		//MARK: #################### RECOVER_PASSWORD ####################
//		container.register(RecoverPasswordModelProtocol.self) { _ in RecoverPasswordModel() }
//		container.register(RecoverPasswordViewModelProtocol.self) { r in
//			let model = r.sureResolve(RecoverPasswordModelProtocol.self)
//
//			// Config for network
//			let network = r.sureResolve(NetworkServiceProtocol.self)
//			let dataStore = r.sureResolve(DataStoreServiceProtocol.self)
//			let viewModel = RecoverPasswordViewModel(model: model,
//													 network: network,
//													 dataStore: dataStore)
//
//			return viewModel
//		}
//		container.register(RecoverPasswordViewProtocol.self) { _ in RecoverPasswordViewController.newInstance() }
//		container.register(RecoverPasswordCoordinatorProtocol.self) { r in
//			let view = r.sureResolve(RecoverPasswordViewProtocol.self)
//			let viewModel = r.sureResolve(RecoverPasswordViewModelProtocol.self)
//			let coordinator = RecoverPasswordCoordinator()
//
//			return r.promiseCoordinator(view: view, viewModel: viewModel, coordinator: coordinator)
//		}
//
//		//MARK: #################### RESET_PASSWORD ####################
//		container.register(ResetPasswordModelProtocol.self) { _ in ResetPasswordModel() }
//		container.register(ResetPasswordViewModelProtocol.self) { r in
//			let model = r.sureResolve(ResetPasswordModelProtocol.self)
//
//			// Config for network
//			let network = r.sureResolve(NetworkServiceProtocol.self)
//			let dataStore = r.sureResolve(DataStoreServiceProtocol.self)
//			let viewModel = ResetPasswordViewModel(model: model,
//												   network: network,
//												   dataStore: dataStore)
//
//			return viewModel
//		}
//		container.register(ResetPasswordViewProtocol.self) { _ in ResetPasswordViewController.newInstance() }
//		container.register(ResetPasswordCoordinatorProtocol.self.self) { r in
//			let view = r.sureResolve(ResetPasswordViewProtocol.self)
//			let viewModel = r.sureResolve(ResetPasswordViewModelProtocol.self)
//			let coordinator = ResetPasswordCoordinator()
//
//			return r.promiseCoordinator(view: view, viewModel: viewModel, coordinator: coordinator)
//		}
//
//		//MARK: #################### USER_INFO ####################
//		container.register(UserInfoModelProtocol.self) { _ in UserInfoModel() }
//		container.register(UserInfoViewModelProtocol.self) { r in
//			let model = r.sureResolve(UserInfoModelProtocol.self)
//
//			// Config for network
//			let network = r.sureResolve(NetworkServiceProtocol.self)
//			let dataStore = r.sureResolve(DataStoreServiceProtocol.self)
//			let viewModel = UserInfoViewModel(model: model,
//											  network: network,
//											  dataStore: dataStore)
//
//			return viewModel
//		}
//		container.register(UserInfoViewProtocol.self) { _ in UserInfoViewController.newInstance() }
//		container.register(UserInfoCoordinatorProtocol.self.self) { r in
//			let view = r.sureResolve(UserInfoViewProtocol.self)
//			let viewModel = r.sureResolve(UserInfoViewModelProtocol.self)
//			let coordinator = UserInfoCoordinator()
//
//			return r.promiseCoordinator(view: view, viewModel: viewModel, coordinator: coordinator)
//		}
//
//		//MARK: ------------------------------------ HOME ------------------------------------
//		container.register(HomeViewProtocol.self) { _ in ASEHomeViewController.newInstance() }
//		container.register(UserInfoViewProtocol.self) { _ in ASEUserInfoViewController.newInstance() }
//	}
//}
