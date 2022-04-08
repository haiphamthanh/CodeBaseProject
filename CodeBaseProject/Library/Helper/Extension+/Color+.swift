//
//  Color+.swift
//  TBVCommunity
//
//  Created by Tịp Tịp on 11/07/2021.
//

import SwiftUI

extension UIColor {
	convenience init(red: Int, green: Int, blue: Int) {
		assert(red >= 0 && red <= 255, "Invalid red component")
		assert(green >= 0 && green <= 255, "Invalid green component")
		assert(blue >= 0 && blue <= 255, "Invalid blue component")
		
		self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
	}
	
	convenience init(rgb: Int) {
		self.init(
			red: (rgb >> 16) & 0xFF,
			green: (rgb >> 8) & 0xFF,
			blue: rgb & 0xFF
		)
	}
}



extension Color {
	// Random Color....
	
	// It's Your Wish yOu can change anything here...
	// or you can also use Array of colors to pick random One....
	static var randomColor: Self {
		let color = UIColor(red: 1, green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
		return Color(color)
	}
}
