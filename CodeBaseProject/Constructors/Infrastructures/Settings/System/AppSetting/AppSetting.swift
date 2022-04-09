//
//  AppSetting.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 25/03/2022.
//

import Swinject

class AppSetting: AppSettingProvider {
	private weak var container: Container!
	func settingInternalTools() {
		let result = InternalToolsBuilder.builder
			.setupInternalTool(.container(container))
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
