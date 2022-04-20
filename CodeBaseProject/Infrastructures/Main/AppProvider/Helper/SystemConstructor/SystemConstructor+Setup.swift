//
//  SystemConstructor+Setup.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 19/04/2022.
//

extension SystemConstructor {
	func setupAppConnect() -> Self {
		@Inject var appSetting: AppSettingProvider
		@Inject var notification: AppNotificationProvider
		@Inject var background: AppBackgroundProvider
		@Inject var color: AppColorProvider
		@Inject var theme: AppThemeProvider
		
		var isSuccess = true
		isSuccess = isSuccess && notification
			.setting1()
			.setting2()
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
			.done()
		
		isSuccess = isSuccess && appSetting
			.setupKeyboard()
			.trackingNetwork()
			.done()
		
		if !isSuccess {
			print("There're something wrong at setting up \(self)")
		}
		
		return self
	}
}
