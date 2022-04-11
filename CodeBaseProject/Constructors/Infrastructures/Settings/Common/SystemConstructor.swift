//
//  SystemConstructor.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 10/04/2022.
//

import Swinject
import IQKeyboardManagerSwift

class SystemConstructor {
	// MARK: - ================================= Private Properties =================================
	private weak var container: Container?
	private weak var window: UIWindow?
	
	// MARK: - ================================= Initialize =================================
	init(container: Container?, window: UIWindow?) {
		self.container = container
		self.window = window
	}
	
	// MARK: - ++++++ Can override functions =================================
	// 1. Register
	func setupExternals(container: Container, window: UIWindow?) {
		// 1. Setup system register
//		SwinjectSystem(container: container, window: window).startSettingUp()
		
		// 2. Setup others
		let appConnect = AppConnect(container: container, window: window)
		appConnect.setting
			.settingInternalTools()
			.settingExternalTools()
			.done()
		appConnect.notification
			.setting1()
			.setting2()
			.done()
		appConnect.background
			.setting1()
			.setting2()
			.done()
		appConnect.color
			.setting1()
			.setting2()
			.done()
		appConnect.theme
			.setting1()
			.setting2()
			.done()
	}
	
	// 2. initialize
	func initialize(with container: Container) {
	}
}

// MARK: - ================================= Usage =================================
extension SystemConstructor {
	final func start() {
		guard let container = container else {
			fatalError("You need to create container before using")
		}
		
		registerSystemProvider(container: container)
		initSystem(container: container, window: window)
		
		AppProvider.shared.holdWindow(window)
		AppProvider.shared.holdDIContainer(container)
	}
}

// MARK: - ================================= Register =================================
private extension SystemConstructor {
	func registerSystemProvider(container: Container) {
		//MARK: ------------------------------------ Provider ------------------------------------
		container.register(AppConnectProvider.self) { [weak self] _ in AppConnect(container: self?.container, window: self?.window) }
		
		//MARK: ------------------------------------ System ------------------------------------
		container.register(AppSettingProvider.self) { [weak self] _ in AppSetting(container: self?.container, window: self?.window) }
		container.register(AppNotificationProvider.self) { _ in AppNotification() }
		container.register(AppBackgroundProvider.self) { _ in AppBackground() }
		container.register(AppColorProvider.self) { _ in AppColor() }
		container.register(AppThemeProvider.self) { _ in AppTheme() }
	}
}

// MARK: - ================================= Private =================================
private extension SystemConstructor {
	func initSystem(container: Container, window: UIWindow?) {
		setupSwinjectTask(container: container, window: window)
		initTask(with: container)
		configTask(with: container)
		return completionTask(with: container)
	}
	
	// Register Task ----------
	func setupSwinjectTask(container: Container, window: UIWindow?) {
		return setupExternals(container: container, window: window)
	}
	
	// Init Task ----------
	func initTask(with container: Container) {
		return initialize(with: container)
	}
	
	// Setup Task ----------
	func configTask(with container: Container) {
		configKeyboard()
		return configNetwork()
	}
	
	// Completion Task ----------
	func completionTask(with container: Container) {
		let appThem = container.sureResolve(AppThemeProvider.self)
		type(of: appThem.self).applyAppearanceDefaults()
		
		//TODO: Transfer to app after done all
//		appCoordinator.startProcess()
//			.subscribe()
//			.disposed(by: disposeBag)
	}
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

