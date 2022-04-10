//
//  SwinjectSystem.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 10/04/2022.
//

import Swinject

// MARK: - ================================= All Service is provided =================================
class SwinjectSystem {
	// MARK: - ================================= Private Properties =================================
	
	private let container: Container
	private let window: UIWindow?
	
	// MARK: - ================================= Initialize =================================
	//+++ DependencyService =======
	init(container: Container, window: UIWindow?) {
		self.container = container
		self.window = window
	}
	
	func startSettingUp() {
		return registerSystemProvider()
	}
}
// MARK: - ================================= Register =================================
private extension SwinjectSystem {
	func registerSystemProvider() {
		//MARK: ------------------------------------ Provider ------------------------------------
		container.register(AppConnectProvider.self) { [weak self] _ in AppConnect(container: self?.container, window: self?.window) }
		
		//MARK: ------------------------------------ System ------------------------------------
		container.register(AppSettingProvider.self) { [weak self] _ in AppSetting(container: self?.container, window: self?.window) }
		container.register(AppNotificationProvider.self) { _ in AppNotification() }
		container.register(AppBackgroundProvider.self) { _ in AppBackground() }
		container.register(AppColorProvider.self) { _ in AppColor() }
		container.register(AppThemeProvider.self) { _ in AppTheme() }
	}
}
