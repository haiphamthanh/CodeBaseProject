//
//  AppProvider.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 08/04/2022.
//

import Foundation

protocol AppProvider {
	var delegate: AppDelegateProvider { get }
	var setting: AppSettingProvider { get }
	var notification: AppNotificationProvider { get }
	var background: AppBackgroundConfigProvider { get }
	var color: AppBackColorProvider { get }
	var theme: AppBackThemeProvider { get }
	var socker: AppSocketSupportProvider { get }
}


