//
//  AppTheme.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 08/04/2022.
//

import UIKit

class AppTheme {
}

// MARK: - ########################## Final ##########################
extension AppTheme: AppThemeProvider {
	static func switchTo(theme: MyTheme) {
		// TODO: Tobe define
		//		MyThemes.switchTo(theme: theme)
	}
	
	static func switchToNext() {
		// TODO: Tobe define
		//		MyThemes.switchToNext()
	}
	
	static func switchNight(isToNight: Bool) {
		// TODO: Tobe define
		//		MyThemes.switchNight(isToNight: isToNight)
	}
	
	static func restoreLastTheme() {
		// TODO: Tobe define
		//		MyThemes.restoreLastTheme()
	}
	
	static func saveLastTheme() {
		// TODO: Tobe define
		//		MyThemes.saveLastTheme()
	}
	
	func useDefaultSetting(_ type: MyThemeSetting) -> Self {
		switch type {
		case .textfield:
			MyTheme.applyAppearanceTextFieldDefaults()
		case .naviBar:
			MyTheme.applyAppearanceNavigationBarDefaults()
		}
		
		return self
	}
	
	func done() -> Bool{
		//TODO: Implement later
		return true
	}
}

enum MyThemeSetting {
	case textfield
	case naviBar
}

private extension MyTheme {
	static func applyAppearanceTextFieldDefaults() {
		UITextField.appearance().keyboardAppearance = .dark
		UITextField.appearance().textColor = .black
		UITextField.appearance().backgroundColor = .darkGray
	}
	
	static func applyAppearanceNavigationBarDefaults() {
		UINavigationBar.appearance().barStyle = .black
		UINavigationBar.appearance().barTintColor = .textColor
		UINavigationBar.appearance().tintColor = FlatColor.Blue.BlueWhale
		UINavigationBar.appearance().backgroundColor = FlatColor.Gray.Dark
		
		UINavigationBar.appearance().barTintColor = FlatColor.Blue.BlueWhale
		UINavigationBar.appearance().tintColor = UIColor.white
		UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
	}
	
//	static private func emptyView(withBackground color: UIColor) -> UIView {
//		let view = UIView()
//		view.backgroundColor = color
//		return view
//	}
}
