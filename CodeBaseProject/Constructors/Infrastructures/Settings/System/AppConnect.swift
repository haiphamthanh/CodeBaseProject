//
//  AppConnect.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 10/04/2022.
//

import Swinject

class AppConnect: AppConnectProvider {
	private let container: Container?
	private let window: UIWindow?
	
	// MARK: - ================================= Initialize =================================
	//+++ DependencyService =======
	init(container: Container?, window: UIWindow?) {
		self.container = container
		self.window = window
	}
	
	var setting: AppSettingProvider {
		return AppSetting(container: container, window: window)
	}
	
	var notification: AppNotificationProvider {
		return AppNotification()
	}
	
	var background: AppBackgroundProvider {
		return AppBackground()
	}
	
	var color: AppColorProvider {
		return AppColor()
	}
	
	var theme: AppThemeProvider {
		return AppTheme()
	}
	
}
