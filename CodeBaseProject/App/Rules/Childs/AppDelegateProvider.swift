//
//  AppDelegateProvider.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 08/04/2022.
//

import UIKit

protocol AppDelegateProvider {
	func app(_ app: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
	func appWillResignActive(_ app: UIApplication)
	func appDidEnterBackground(_ app: UIApplication)
	func appWillEnterForeground(_ app: UIApplication)
	func appDidBecomeActive(_ app: UIApplication)
	func appWillTerminate(_ app: UIApplication)
	func app(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool
	func app(_ app: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool
}
