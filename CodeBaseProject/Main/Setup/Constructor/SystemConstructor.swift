//
//  SystemConstructor.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 10/04/2022.
//

import SwiftUI
import Swinject
import IQKeyboardManagerSwift

class SystemConstructor {
	// MARK: - ================================= Private Properties =================================
	private weak var container: Container?
	
	// MARK: - ================================= Initialize =================================
	init(container: Container?) {
		self.container = container
	}
}

// MARK: - ================================= Usage =================================
extension SystemConstructor {
	final func start() {
		guard let container = container else {
			fatalError("You need to create container before using")
		}
		
		registerSystemProvider(container: container)
		setupTools(container: container)
		setupAppConnect(container: container)
	}
}

// MARK: - ================================= Register =================================
private extension SystemConstructor {
	func registerSystemProvider(container: Container) {
		container.register(AppConnectProvider.self) { [weak self] _ in AppConnect(container: self?.container) }
//		container.register(AppSettingProvider.self) { [weak self] _ in AppSetting(container: self?.container) }
		container.register(AppNotificationProvider.self) { _ in AppNotification() }
		container.register(AppBackgroundProvider.self) { _ in AppBackground() }
		container.register(AppColorProvider.self) { _ in AppColor() }
		container.register(AppThemeProvider.self) { _ in AppTheme() }
	}
}

// MARK: - ================================= Setup =================================
private extension SystemConstructor {
	func setupTools(container: Container) {
		let _ = InternalToolsBuilder.builder
			.setupSceneHelper(container: container)
			.setupScreens(container: container)
			.finish()
		
		let _ = ExternalPluginsBuilder.builder
			.useExternalService(.facebook)
			.finish()
	}
	
	func setupAppConnect(container: Container) {
		let appConnect = AppConnect(container: container)
		appConnect.notification.setting1().setting2().done()
		appConnect.background.setting1().setting2().done()
		appConnect.color.setting1().setting2().done()
		appConnect.theme.setting1().setting2().done()
	}
}

// MARK: - ================================= Private =================================
private extension SystemConstructor {
//	func initSystem(container: Container) {
//		setupSwinjectTask(container: container)
//		initTask(with: container)
//		configTask(with: container)
//
//		return completionTask(with: container)
//	}
//
//	// Register Task ----------
//	func setupSwinjectTask(container: Container) {
//		return setupExternals(container: container)
//	}
//
//	// Init Task ----------
//	func initTask(with container: Container) {
//		return initialize(with: container)
//	}
//
//	// Config Task ----------
//	func configTask(with container: Container) {
//		configKeyboard()
//		return configNetwork()
//	}
	
	// Completion Task ----------
	func completionTask(with container: Container) {
		let appThem = container.sureResolve(AppThemeProvider.self)
		type(of: appThem.self).applyAppearanceDefaults()
		
		//TODO: Transfer to app after done all
//		let appCoordinator = appCoordinator()
//		appCoordinator?.startProcess()
//			.subscribe()
//			.disposed(by: disposeBag)
	}
	
	
	
//	func appCoordinator() -> AppRootCoordinator? {
//		let viewModel: AppRootViewModel = AppRootViewModelImpl()
//		let viewModelAdapter = AppRootViewModelAdapter(viewModel: viewModel)
//		let view = AnyView(AppRootView(pros: viewModelAdapter))
//		let navigator = DefaultNavigation()
//
//		guard let viewModelWithCoorSupport = viewModel as? AppRootViewModelCoorSupport else {
//			return nil
//		}
//
//		let coordinator: AppRootCoordinator = AppRootCoordinatorImpl(navigator: navigator,
//																	 viewModel: viewModelWithCoorSupport,
//																	 view: view)
//		return coordinator
//	}
}

// MARK: - ================================= Other tasks =================================
private extension SystemConstructor {
	// All sub Tasks --------------------------------------------------
	func configKeyboard() {
		IQKeyboardManager.shared.enable = true
		IQKeyboardManager.shared.enableAutoToolbar = false
		IQKeyboardManager.shared.shouldResignOnTouchOutside = true
		IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Done"
	}
	
	func configNetwork() {
		//		LoadingManager.shared.startInternetTracking()
	}
}