//
//  AppConnectProvider.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 08/04/2022.
//

import Foundation

protocol AppConnectProvider {
//	var setting: AppSettingProvider { get }
	var notification: AppNotificationProvider { get }
	var background: AppBackgroundProvider { get }
	var color: AppColorProvider { get }
	var theme: AppThemeProvider { get }
}


