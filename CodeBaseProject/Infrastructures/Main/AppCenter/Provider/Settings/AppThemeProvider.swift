//
//  AppThemeProvider.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 08/04/2022.
//

import Foundation

enum MyTheme: Int {
	case normal = 0
	case red
	case yello
	case blue
	case night
}

protocol AppThemeProvider {
	// MARK: - Setup
	func useDefaultSetting(_ type: MyThemeSetting) -> Self
	func done() -> Bool
	
	static func switchTo(theme: MyTheme)
	static func switchToNext()
	
	// MARK: - Switch Night
	static func switchNight(isToNight: Bool)
	
	// MARK: - Save & Restore
	static func restoreLastTheme()
	static func saveLastTheme()
}
