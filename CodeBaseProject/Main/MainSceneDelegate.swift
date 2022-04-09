//
//  MainSceneDelegate.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 08/04/2022.
//

import SwiftUI

class MainSceneDelegate: UIResponder, UIWindowSceneDelegate {
	var window: UIWindow?
	private lazy var delegator: AppSceneDelegateProvider = AppCommonProvider.appSceneDelegate(window: window)
	
	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		return delegator.scene(scene, willConnectTo: session, options: connectionOptions)
	}
	
	func sceneDidDisconnect(_ scene: UIScene) {
		return delegator.sceneDidDisconnect(scene)
	}

	func sceneDidBecomeActive(_ scene: UIScene) {
		return delegator.sceneDidBecomeActive(scene)
	}

	func sceneWillResignActive(_ scene: UIScene) {
		return delegator.sceneWillResignActive(scene)
	}

	func sceneWillEnterForeground(_ scene: UIScene) {
		return delegator.sceneWillEnterForeground(scene)
	}

	func sceneDidEnterBackground(_ scene: UIScene) {
		return delegator.sceneDidEnterBackground(scene)
	}
}
