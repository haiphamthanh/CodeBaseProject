//
//  NotificationManager.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 25/03/2022.
//

import UIKit

//MARK: - Definations
enum NotificationSender {
	//MARK: Subs
	struct AppType {
		let id = UUID()
		let data: AppNotificationData
	}
	
	struct NormalType {
		let id = UUID()
		let data: UNNotificationContent
	}
	
	//MARK: Items
	case app(AppType)
	case normal(NormalType)
	
	//MARK: Init
	init?(_ notification: Notification?) {
		guard let content = notification?.object else {
			return nil
		}
		
		switch content.self {
		case is AppType:
			self = .app(content as! AppType)
		case is NormalType:
			self = .normal(content as! NormalType)
		default:
			return nil
		}
	}
}

//MARK: - Manager
class NotificationManager {
	//MARK: Instance
	static let shared = NotificationManager()
	private init() { }
	
	//MARK: Outputs
	
	//MARK: Configurations
	final func startMonitoringNotification() {
		NotificationCenter.default
			.addObserver(self,
						 selector: #selector(didReceived(_:)),
						 name: AppNotificationData.didReceiveNotification,
						 object: nil)
	}
	
	@objc func didReceived(_ notification: Notification) {
		guard let sender = NotificationSender(notification) else {
			return print("Can't be founded action for content \(notification)")
		}
		
		switch sender {
		case .app(let sender):
			let data = sender.data
			return print("Received app \(data)")
		case .normal(let sender):
			let data = sender.data
			return print("Received normal \(data)")
		}
	}
}

extension NotificationManager {
	private func handlePushNotification(userInfo: [AnyHashable : Any]) {
		guard let aps = userInfo["aps"] as? NSDictionary,
			  let eventRawString = userInfo["gcm.notification.event"] as? String else {
			return
		}
		
		let event = eventRawString.dictionaryFromJSONString as? NSDictionary
		let notificationObject = AppNotificationData(aps: aps, event: event)
	}
}
