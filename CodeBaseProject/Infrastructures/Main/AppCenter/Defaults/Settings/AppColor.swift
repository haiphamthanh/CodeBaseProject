//
//  AppColor.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 04/04/2022.
//

import SwiftUI

class ShareEnvironment {
	@Environment(\.colorScheme) var colorScheme
	static let shared = ShareEnvironment()
}

extension Color {
	// Custom Color
	static let textColor = Color(UIColor.textColor)
	static let menuTextColor = Color(UIColor.menuTextColor)
	static let textLightColor = Color(UIColor.textLightColor)
	static let backgroundColor = Color(UIColor.backgroundColor)
	static let backgroundMenuGray = Color(UIColor.backgroundMenuGray)
	
	// Red
	static let red600 = Color(UIColor.red600)
	
	// Blue
	static let blue800 = Color(UIColor.blue800)
	
	// Grey
	static let grey100 = Color(UIColor.grey100)
	static let grey300 = Color(UIColor.grey300)
	static let green700 = Color(UIColor.green700)
	static let grey800 = Color(UIColor.grey800)
	
	// Yellow
	static let yellow100 = Color(UIColor.yellow100)
	static let blueGray700 = Color(UIColor.blueGray700)
	static let sideMenuColor = Color(UIColor.sideMenuColor)
	static let sideMenuTextColor = Color(UIColor.sideMenuTextColor)
}

extension UIColor {
	
	// Custom Color
	static let textColor = UIColor(named: "textColor") ?? UIColor(rgb: 0x28292f)
	static let backgroundColor = UIColor(named: "backgroundColor") ?? UIColor.white
	static let backgroundMenuGray = UIColor(rgb: 0x3C4043)
	static let menuTextColor = UIColor(rgb: 0xEBEEF0)
	static let textLightColor = UIColor(named: "textColor") ?? UIColor(rgb: 0x3c3d43)
	
	// Red
	static let red600 = UIColor(rgb: 0xE53935)
	
	// Blue
	static let blue800 = UIColor(rgb: 0x0277BD)
	static let sideMenuTextColor = UIColor(named: "SideMenuTextColor") ?? UIColor(rgb: 0x0277BD)
	
	// Grey
	static let grey100 = UIColor(rgb: 0xF5F5F5)
	static let grey300 = UIColor(rgb: 0xE0E0E0)
	static let green700 = UIColor(rgb: 0x00BFA5)
	static let grey800 = UIColor(rgb: 0x424242)
	
	// Yellow
	static let yellow100 = UIColor(rgb: 0xF57C00)
	static let blueGray700 = UIColor(rgb: 0x37474F)
	static let sideMenuColor = UIColor(named: "SideMenuColor") ?? UIColor(rgb: 0x37474F)
}


class AppColor: AppColorProvider {
	func setting1() -> Self {
		//TODO: Implement later
		return self
	}
	
	func setting2() -> Self {
		//TODO: Implement later
		return self
	}
	
	func done() -> Bool{
		//TODO: Implement later
		return true
	}
}
