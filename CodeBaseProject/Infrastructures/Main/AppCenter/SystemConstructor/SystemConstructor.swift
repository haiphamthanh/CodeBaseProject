//
//  SystemConstructor.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 10/04/2022.
//

import Swinject

class SystemConstructor {
	private weak var container: Container?
	init(container: Container?) {
		self.container = container
	}
}

extension SystemConstructor {
	func start() -> Bool {
		guard let container = container else {
			fatalError("You need to create container before using")
		}
		
		return register(to: container)
			.runSettingUp()
	}
}

// MARK: SystemConstructor + Register
private extension SystemConstructor {
	func register(to container: Container) -> Self {
		return registerPrimaryServices(to: container)
			.registerExternalServices(to: container)
	}
	
	func registerPrimaryServices(to container: Container) -> Self {
		let result = AppRegister.builder
			.registerSystemTools(to: container)
			.registerUIToolsHelper(to: container)
			.registerUI(to: container)
			.registerStory(to: container)
			.registerDomain(to: container)
			.finish()
		
		if !result.success {
			fatalError("Opp!! There's something wrong while setting up")
		}
		
		return self
	}
	
	func registerExternalServices(to container: Container) -> Self {
		let result = ExternalPluginsBuilder.builder
			.useExternalServices([.facebook, .google, .firebase, .webSocket])
			.finish()
		
		if !result.success {
			fatalError("Opp!! There's something wrong while setting up \(self)")
		}
		
		return self
	}
}

// MARK: SystemConstructor + Setup
private extension SystemConstructor {
	func runSettingUp() -> Bool {
		@Inject var appSetting: AppSettingProvider
		@Inject var notification: AppNotificationProvider
		@Inject var background: AppBackgroundProvider
		@Inject var color: AppColorProvider
		@Inject var theme: AppThemeProvider
		
		var isSuccess = true
		isSuccess = isSuccess && notification
			.startMonitoring()
			.requestPermission()
			.done()
		
		isSuccess = isSuccess && background
			.setting1()
			.setting2()
			.done()
		
		isSuccess = isSuccess && color
			.setting1()
			.setting2()
			.done()
		
		isSuccess = isSuccess && theme
			.useDefaultSetting(.textfield)
			.useDefaultSetting(.naviBar)
			.useDefaultSetting(.tabBar)
			.done()
		
		isSuccess = isSuccess && appSetting
			.setupKeyboard()
			.trackingNetwork()
			.done()
		
		if !isSuccess {
			print("Opp!! There's something wrong while setting up \(self)")
		}
		
		return isSuccess
	}
}
