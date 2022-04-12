//
//  AppConnect.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 10/04/2022.
//

import Swinject

class AppConnect: AppConnectProvider {
	private weak var container: Container?
	
	// MARK: - ================================= Initialize =================================
	init(container: Container?) {
		self.container = container
	}
	
//	var setting: AppSettingProvider {
//		return AppSetting(container: container)
//	}
	
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
