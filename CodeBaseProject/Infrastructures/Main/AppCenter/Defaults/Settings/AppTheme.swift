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
		case .tabBar:
			MyTheme.applyAppearanceTabBarDefaults()
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
	case tabBar
}

private extension MyTheme {
	static func applyAppearanceTextFieldDefaults() {
		//		UITextField.appearance().keyboardAppearance = .dark
		//		UITextField.appearance().textColor = .black
		//		UITextField.appearance().backgroundColor = .darkGray
	}
	
	static func applyAppearanceNavigationBarDefaults() {
		//		UINavigationBar.appearance().barStyle = .default
		//		UINavigationBar.appearance().barTintColor = .textColor
		//		UINavigationBar.appearance().tintColor = FlatColor.Blue.BlueWhale
		//		UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
		//		UINavigationBar.appearance().backgroundColor = FlatColor.Red.Valencia
		//		UINavigationBar.appearance().isHidden = true
		//		UINavigationBar.appearance().isOpaque = true
		
		//		UINavigationBar.appearance().barTintColor = FlatColor.Blue.BlueWhale
		//		UINavigationBar.appearance().tintColor = UIColor.red
		//		UINavigationBar.appearance().isHidden = true
		
		//		UINavigationBar.appearance().backgroundColor = .red600
		//		UINavigationBar.appearance().barTintColor = .gray
		//		UINavigationBar.appearance().tintColor = .white
		//		UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor.white]
		//		UINavigationBar.appearance().isOpaque = true
		
		//		UINavigationBar.appearance().backgroundColor = .red600
		//		UINavigationBar.appearance().barTintColor = .red600
		//		UINavigationBar.appearance().tintColor = .white
		//		UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor.white]
		//		UINavigationBar.appearance().isOpaque = false
		
		//		UITableView.appearance().allowsSelection = false
		//		UITableView.appearance().separatorStyle = .none
		//		//		UITableView.appearance().backgroundColor = .clear
		//		UILabel.appearance(whenContainedInInstancesOf: [UISegmentedControl.self]).numberOfLines = 0
		//		UILabel.appearance(whenContainedInInstancesOf: [UISegmentedControl.self]).minimumScaleFactor = 0.7
		//		UITableViewHeaderFooterView.appearance().tintColor = UIColor(named: "headerColor")
		//		UITableView.appearance().tableHeaderView = UIView(frame: CGRect.zero)
		//		if #available(iOS 14.0, *) {
		//			// Fallback on earlier versions
		//			UITableView.appearance().separatorColor = .clear
		//			UITableViewCell.appearance().selectionStyle = .none
		//			UITableViewCell.appearance().backgroundColor = .clear
		//		}
	}
	
	static func applyAppearanceTabBarDefaults() {
		// Hidding native one...
		UITabBar.appearance().isHidden = true
	}
	
	//	static private func emptyView(withBackground color: UIColor) -> UIView {
	//		let view = UIView()
	//		view.backgroundColor = color
	//		return view
	//	}
}
