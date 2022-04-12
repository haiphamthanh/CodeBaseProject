//
//  Main.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 12/03/2022.
//

import SwiftUI

@main
class Main: UIResponder {
	private lazy var delegator = AppProvider.appDelegate
	// MARK: UISceneSession Lifecycle

	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
		// Called when a new scene session is being created.
		// Use this method to select a configuration to create the new scene with.
		return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
	}

	func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
		// Called when the user discards a scene session.
		// If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
		// Use this method to release any resources that were specific to the discarded scenes, as they will not return.
	}
}

// MARK: - ================================= Extension =================================
extension Main: UIApplicationDelegate {
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		return delegator.app(application, didFinishLaunchingWithOptions: launchOptions)
	}
	
	func applicationWillResignActive(_ application: UIApplication) {
		return delegator.appWillResignActive(application)
	}
	
	func applicationDidEnterBackground(_ application: UIApplication) {
		return delegator.appDidEnterBackground(application)
	}
	
	func applicationWillEnterForeground(_ application: UIApplication) {
		return delegator.appWillEnterForeground(application)
	}
	
	func applicationDidBecomeActive(_ application: UIApplication) {
		return delegator.appDidBecomeActive(application)
	}
	
	func applicationWillTerminate(_ application: UIApplication) {
		return delegator.appWillTerminate(application)
	}
	
	func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
		return delegator.app(app, open: url, options: options)
	}
	
	func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
		return delegator.app(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
	}
}
