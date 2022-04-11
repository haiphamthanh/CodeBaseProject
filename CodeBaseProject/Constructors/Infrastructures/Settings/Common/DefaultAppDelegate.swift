//
//  DefaultAppDelegate.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 25/03/2022.
//

import UIKit

class DefaultAppDelegate: AppDelegateProvider {
	// MARK: - ================================= =================================
	func app(_ app: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		return true
	}
	
	func appWillResignActive(_ app: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
	}
	
	func appDidEnterBackground(_ app: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}
	
	func appWillEnterForeground(_ app: UIApplication) {
		// Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
	}
	
	func appDidBecomeActive(_ app: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}
	
	func appWillTerminate(_ app: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}
	
	func app(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
		// no equiv. notification. return NO if the application can't open for some reason
		return false
	}
	
	// [START old_delegate]
	func app(_ app: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
		// no equiv. notification. return NO if the application can't open for some reason
		return false
	}
}
