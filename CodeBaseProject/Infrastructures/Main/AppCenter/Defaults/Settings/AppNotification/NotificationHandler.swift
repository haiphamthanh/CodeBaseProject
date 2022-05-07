//
//  NotificationHandler.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 07/05/2022.
//
/// https://blog.techchee.com/scheduling-local-notification-swiftui/
/// https://github.com/ketyung/SwiftUILocalNoti

import UserNotifications

class NotificationHandler : NSObject {
	static let shared = NotificationHandler()
	private override init() { }
	
	func requestPermission(_ delegate : UNUserNotificationCenterDelegate? = nil ,
						   onDeny handler : (()-> Void)? = nil){
		
		let center = UNUserNotificationCenter.current()
		center.getNotificationSettings(completionHandler: { settings in
			if settings.authorizationStatus == .denied {
				if let handler = handler {
					handler()
				}
				return print("Application Not Allowed to Display Notifications")
			}
			
			if settings.authorizationStatus != .authorized  {
				center.requestAuthorization(options: [.alert, .sound, .badge]) { _ , error in
					if let error = error {
						print("error handling \(error)")
					}
				}
			}
		})
		
		center.delegate = delegate ?? self
	}
}

// MARK: Handler
extension NotificationHandler : UNUserNotificationCenterDelegate {
	/** Background handler*/
	/** When app in background notification will be presented in Device screen
	 *	When we will transit to application whenever tap to this notification view and this one will be called
	 *	Notice:
	 *		When application is terminated, this one still be called that why we need to call it in didFinishLaunch(Appdelegate)
	 *		If you want to show anythings, just consider to make sure that your window is available
	 *		Any actions to try to present view at this time may take crashing your app
	 */
	func userNotificationCenter(_ center: UNUserNotificationCenter,
								didReceive response: UNNotificationResponse,
								withCompletionHandler completionHandler: @escaping () -> Void) {
		
//		let notiName = Notification.Name(response.notification.request.identifier)
		let notiName = AppNotificationData.didReceiveNotification
		let object = NotificationSender.NormalType(data: response.notification.request.content)
		NotificationCenter.default.post(name:notiName , object: object)
		completionHandler()
		print("\(#function) did received \(response)")
	}
	
	/** Foreground handler*/
	/** Handle notification when the app is in foreground */
	func userNotificationCenter(_ center: UNUserNotificationCenter,
								willPresent notification: UNNotification,
								withCompletionHandler completionHandler:
								@escaping (UNNotificationPresentationOptions) -> Void) {
		
//		let notiName = Notification.Name(notification.request.identifier)
		let notiName = AppNotificationData.didReceiveNotification
		let object = NotificationSender.NormalType(data: notification.request.content)
		NotificationCenter.default.post(name:notiName , object: object)
		completionHandler(.sound)
		
		print("\(#function) did received \(notification)")
	}
}

// MARK: Local notification utils
extension NotificationHandler  {
	func addNotification(id : String,
						 title : String,
						 subtitle : String ,
						 sound : UNNotificationSound = UNNotificationSound.default,
						 trigger : UNNotificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)) {
		
		let content = UNMutableNotificationContent()
		content.title = title
		content.subtitle = subtitle
		content.sound = sound
		
		let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
		UNUserNotificationCenter.current().add(request)
	}
	
	
	func removeAllNotifications(){
		UNUserNotificationCenter.current().removeAllDeliveredNotifications()
		UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
	}
	
	
	func removeNotifications(_ ids : [String]){
		UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ids)
		UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ids)
	}
}
