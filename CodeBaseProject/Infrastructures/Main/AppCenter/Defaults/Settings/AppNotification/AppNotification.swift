//
//  AppNotification.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 08/04/2022.
//

import Foundation

class AppNotification: AppNotificationProvider {
	func requestPermission() -> Self {
		NotificationHandler.shared.requestPermission()
		return self
	}
	
	func startMonitoring() -> Self {
		NotificationManager.shared.startMonitoringNotification()
		return self
	}
	
	func done() -> Bool{
		return true
	}
}
