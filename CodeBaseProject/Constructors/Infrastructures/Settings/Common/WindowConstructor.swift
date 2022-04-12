//
//  WindowConstructor.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 12/04/2022.
//

import Swinject
import IQKeyboardManagerSwift

class WindowConstructor {
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
	func setupExternals(container: Container, window: UIWindow) {
		// 1. Setup system register
//		SwinjectSystem(container: container, window: window).startSettingUp()
		
		// 2. Setup others
		let _ = InternalToolsBuilder.builder
			.setupInternalTool(.window(window, container))
			.finish()
	}
	
	// 2. initialize
	func initialize(with container: Container) {
	}
}

// MARK: - ================================= Usage =================================
extension WindowConstructor {
	final func start() {
		guard let container = container, let window = window else {
			fatalError("You need to create container before using")
		}
		
		initSystem(container: container, window: window)
		AppProvider.shared.holdWindow(window)
	}
}

// MARK: - ================================= Private =================================
private extension WindowConstructor {
	func initSystem(container: Container, window: UIWindow) {
		setupSwinjectTask(container: container, window: window)
		initTask(with: container)
		configTask(with: container)
		return completionTask(with: container)
	}
	
	// Register Task ----------
	func setupSwinjectTask(container: Container, window: UIWindow) {
		return setupExternals(container: container, window: window)
	}
	
	// Init Task ----------
	func initTask(with container: Container) {
		return initialize(with: container)
	}
	
	// Config Task ----------
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
private extension WindowConstructor {
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


