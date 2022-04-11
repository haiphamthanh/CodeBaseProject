//
//  AppCommonProvider.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 09/04/2022.
//

import Swinject

class AppProvider {
	// MARK: - ================================= Properties =================================
	//+++ Singleton ============
	static let shared = AppProvider()
	private(set) var window: UIWindow?
	private(set) var container: Container?

	private init() {}
	
	final func holdWindow(_ window: UIWindow?) {
		self.window = window
	}
	
	final func holdDIContainer(_ container: Container) {
		self.container = container
	}
}

extension AppProvider {
	static var appDelegate: AppDelegateProvider {
		return DefaultAppDelegate()
	}
	
	static func appSceneDelegate() -> AppSceneDelegateProvider {
		return DefaultAppSceneDelegate()
	}
}
