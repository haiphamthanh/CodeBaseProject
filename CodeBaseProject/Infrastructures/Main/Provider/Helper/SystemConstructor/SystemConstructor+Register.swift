//
//  SystemConstructor+Register.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 19/04/2022.
//

import Swinject

extension SystemConstructor {
	func registerSystemProviders(to container: Container) -> Self {
		container.register(AppSettingProvider.self) { _ in AppSetting() }
		container.register(AppNotificationProvider.self) { _ in AppNotification() }
		container.register(AppBackgroundProvider.self) { _ in AppBackground() }
		container.register(AppColorProvider.self) { _ in AppColor() }
		container.register(AppThemeProvider.self) { _ in AppTheme() }
		container.register(AppConnectProvider.self) { _ in AppConnect() }
		
		return self
	}
	
	func registerTools(to container: Container) -> Self {
		let _ = InternalToolsBuilder.builder
			.registerUIToolsHelper(to: container)
			.registerUI(to: container)
			.registerStory(to: container)
			.finish()
		
		let _ = ExternalPluginsBuilder.builder
			.useExternalService(.facebook)
			.finish()
		
		return self
	}
}
