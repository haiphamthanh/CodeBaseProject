//
//  AppSetting.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 25/03/2022.
//

import Swinject

class AppSetting: AppSettingProvider {
	private let container: Container?
	private let window: UIWindow?
	
	// MARK: - ================================= Initialize =================================
	//+++ DependencyService =======
	init(container: Container?, window: UIWindow?) {
		self.container = container
		self.window = window
	}
	
	//+++ AppSettingProvider =======
	func settingInternalTools() {
		guard let container = container, let window = window else {
			fatalError("Can't be founded container and window")
		}

		let result = InternalToolsBuilder.builder
			.setupInternalTool(.container(container, window))
			.finish()
		
		guard let error = result.error else {
			return
		}
		
		// TODO: Show error for setting up
		print(error)
	}
	
	func settingExternalTools() {
		let result = ExternalToolsBuilder.builder
			.useExternalService(.facebook)
			.finish()
		
		guard let error = result.error else {
			return
		}
		
		// TODO: Show error for setting up
		print(error)
	}
}
