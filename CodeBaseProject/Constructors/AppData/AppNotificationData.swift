//
//  AppNotificationData.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 03/04/2022.
//

import SwiftUI
import Combine

enum NotificationType: Int {
	case unknown = 0
	case event
	case survey
	case newAccount
	
	init(type: String?) {
		guard let type = type, let rawType = Int(type) else {
			self = .unknown
			return
		}
		
		self = NotificationType(rawValue: rawType) ?? .unknown
	}
}

struct AppNotificationData {
	var aps: Alert?
	var event: Event?
	var category: String?
	var sound: String?
	
	struct Alert {
		var body: String?
		var title: String?
		
		init(aps: NSDictionary?) {
			self.body = aps?["body"] as? String
			self.title = aps?["title"] as? String
		}
	}
	
	struct Event {
		var topicName: String?
		var id: String?
		var type: NotificationType?
		
		init(event: NSDictionary) {
			self.topicName = event["topicName"] as? String
			self.id = event["id"] as? String
			self.type = NotificationType(type: event["type"] as? String)
		}
	}
	
	init(aps: NSDictionary, event: NSDictionary?) {
		self.aps = Alert(aps: aps["alert"] as? NSDictionary)
		self.category = aps["category"] as? String
		self.sound = aps["sound"] as? String
		
		if let event = event {
			self.event = Event(event: event)
		}
	}
}
