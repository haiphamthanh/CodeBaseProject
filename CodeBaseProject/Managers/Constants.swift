//
//  Constants.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 03/04/2022.
//

import SwiftUI

// MARK: - ================================= AppNotification Keys =================================
extension AppNotificationData {
	public static let didReceiveNotification = Notification.Name(rawValue: "org.gochickencode.notification.name.notification.didReceive")
	public static let notificationKey = "org.gochickencode.notification.key.notification"
}

extension AppUserData {
	public static let didSigned = Notification.Name(rawValue: "org.gochickencode.notification.name.auth.didSigned")
	public static let signedUserInfoKey = "org.gochickencode.notification.key.signedUserInfo"
	
	public static let didSignOut = Notification.Name(rawValue: "org.gochickencode.notification.name.auth.didSignOut")
	public static let didForceSignOut = Notification.Name(rawValue: "org.gochickencode.notification.name.auth.didForceSignOut")
}


// MARK: - ================================= App commons =================================
var isBottomIndicatorAvailable: Bool {
	if #available(iOS 11.0, *),
	   let keyWindow = AppProvider.shared.window,
	   keyWindow.safeAreaInsets.bottom > 0 {
		return true
	}
	
	return false
}
let appBottomPadding: CGFloat = isBottomIndicatorAvailable ? 0 : 10
