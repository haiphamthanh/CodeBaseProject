//
//  AppSetting.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 19/04/2022.
//

import IQKeyboardManagerSwift

class AppSetting: AppSettingProvider {
	func setupKeyboard() -> Self {
		IQKeyboardManager.shared.enable = true
		IQKeyboardManager.shared.enableAutoToolbar = false
		IQKeyboardManager.shared.shouldResignOnTouchOutside = true
		IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Done"
		return self
	}
	
	func trackingNetwork() -> Self {
		//		LoadingManager.shared.startInternetTracking()
		return self
	}
	
	func done() -> Bool {
		return true
	}
}
