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
	func settingInternalTools() -> Self {
		guard let container = container, let window = window else {
			fatalError("Can't be founded container and window")
		}

		let result = InternalToolsBuilder.builder
			.setupInternalTool(.container(container, window))
			.finish()
		
		guard let error = result.error else {
			return self
		}
		
		// TODO: Show error for setting up
		print(error)
		return self
	}
	
	func settingExternalTools() -> Self {
		let result = ExternalToolsBuilder.builder
			.useExternalService(.facebook)
			.finish()
		
		guard let error = result.error else {
			return self
		}
		
		// TODO: Show error for setting up
		print(error)
		return self
	}
	
	func done() {
		//TODO: Do something after done setting up
	}
}
