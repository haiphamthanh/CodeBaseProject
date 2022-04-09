//
//  AppCommonProvider.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 09/04/2022.
//

import UIKit

class AppCommonProvider {
	static var appDelegate: AppDelegateProvider {
		DefaultAppDelegate()
	}
	
	static func appSceneDelegate(window: UIWindow?) -> AppSceneDelegateProvider {
		DefaultAppSceneDelegate(window: window)
	}
}
