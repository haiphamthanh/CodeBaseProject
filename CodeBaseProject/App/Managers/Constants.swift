//
//  Constants.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 03/04/2022.
//

import Foundation

// MARK: - ================================= AppNotification Keys =================================
extension AppNotificationModel {
	public static let didReceiveNotification = Notification.Name(rawValue: "org.gochickencode.notification.name.notification.didReceive")
	public static let notificationKey = "org.gochickencode.notification.key.notification"
}

extension AppUserModel {
	public static let didSigned = Notification.Name(rawValue: "org.gochickencode.notification.name.auth.didSigned")
	public static let signedUserInfoKey = "org.gochickencode.notification.key.signedUserInfo"
	
	public static let didSignOut = Notification.Name(rawValue: "org.gochickencode.notification.name.auth.didSignOut")
	public static let didForceSignOut = Notification.Name(rawValue: "org.gochickencode.notification.name.auth.didForceSignOut")
}
