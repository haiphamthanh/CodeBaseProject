//
//  AppSetting.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 25/03/2022.
//

import Swinject

class AppSetting: AppSettingProvider {
	private weak var container: Container!
	func settingMainServices() {
		let result = MainServicesBuilder.builder
			.useService(.container(container))
			.build()
		
		guard let error = result.error else {
			return
		}
		
		// TODO: Show error for setting up
		print(error)
	}
	
	func settingExternalServices() {
		let result = ExternalServicesBuilder.builder
			.useService(.facebook)
			.build()
		
		guard let error = result.error else {
			return
		}
		
		// TODO: Show error for setting up
		print(error)
	}
}
