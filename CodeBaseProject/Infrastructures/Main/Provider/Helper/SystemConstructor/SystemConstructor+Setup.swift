//
//  SystemConstructor+Setup.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 19/04/2022.
//

extension SystemConstructor {
	func setupAppConnect() -> Self {
		@Inject var appConnect: AppConnectProvider
		
		let notification = appConnect.notification
			.setting1()
			.setting2()
			.done()
		
		let background = appConnect.background
			.setting1()
			.setting2()
			.done()
		
		let color = appConnect.color
			.setting1()
			.setting2()
			.done()
		
		let theme = appConnect.theme
			.setting1()
			.setting2()
			.done()
		
		let appSetting = appConnect.appSetting
			.setupKeyboard()
			.trackingNetwork()
			.done()
		
		let isSuccess = notification && background && color && theme && appSetting
		
		if !isSuccess {
			print("There're something wrong at setting up \(self)")
		}
		
		return self
	}
	
	func applyAppTheme() -> Self {
		@Inject var appThem: AppThemeProvider
		type(of: appThem.self).applyAppearanceDefaults()
		
		return self
	}
}
