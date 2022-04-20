//
//  AppConnect.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 10/04/2022.
//

import Swinject

class AppConnect: AppConnectProvider {
	@Inject var appSetting: AppSettingProvider
	@Inject var notification: AppNotificationProvider
	@Inject var background: AppBackgroundProvider
	@Inject var color: AppColorProvider
	@Inject var theme: AppThemeProvider
}
