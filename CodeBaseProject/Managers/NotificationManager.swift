//
//  NotificationManager.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 25/03/2022.
//

import SwiftUI
import Combine

class NotificationManager: ObservableObject {
	//MARK: - Instance
	static let shared = NotificationManager()
	private init() {
	}

	//MARK: - Outputs
	@Published private(set) var hasNewNotification: Bool = false
	private(set) var notification: AppNotificationData? = nil

	//MARK: - Actions
	func got(notification: AppNotificationData) {
		self.notification = notification

		// We're just making it new when the event are available
		hasNewNotification = notification.event != nil
		
		let notification = Notification(name: AppNotificationData.didReceiveNotification,
										object: nil,
										userInfo: [AppNotificationData.notificationKey: notification])
		NotificationCenter.default.post(notification)
	}

	func seen() {
		hasNewNotification = false
	}
}
