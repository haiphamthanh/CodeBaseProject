//
//  SystemRegister.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 20/04/2022.
//

import Swinject

class SystemRegister {
	private weak var container: Container!
	init(_ container: Container) {
		self.container = container
	}
	
	func start() {
		return registerSystemProviders()
	}
}

private extension SystemRegister {
	func registerSystemProviders() {
		container.register(AppSettingProvider.self) { _ in AppSetting() }
		container.register(AppNotificationProvider.self) { _ in AppNotification() }
		container.register(AppBackgroundProvider.self) { _ in AppBackground() }
		container.register(AppColorProvider.self) { _ in AppColor() }
		container.register(AppThemeProvider.self) { _ in AppTheme() }
	}
}
