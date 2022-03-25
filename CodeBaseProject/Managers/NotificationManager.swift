//
//  NotificationManager.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 25/03/2022.
//

import Foundation
import SwiftUI
import Combine

//class NotificationManager: ObservableObject {
//	//MARK: - Instance
//	static let shared = NotificationManager()
//	private init() {
//	}
//
//	//MARK: - Outputs
//	@Published private(set) var hasNewNotification: Bool = false
//	private(set) var notification: NotificationModel? = nil
//
//	//MARK: - Actions
//	func got(notification: NotificationModel) {
//		self.notification = notification
//
//		// We're just making it new when the event are available
//		hasNewNotification = notification.event != nil
//	}
//
//	func seen() {
//		hasNewNotification = false
//	}
//}
