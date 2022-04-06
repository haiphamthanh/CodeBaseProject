//
//  BackBarButtonItem.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 05/04/2022.
//

import UIKit

class BackBarButtonItem: UIBarButtonItem {
	@available(iOS 14.0, *)
	override var menu: UIMenu? {
		set {
			/* Don't set the menu here */
			/* super.menu = menu */
		}
		get {
			return super.menu
		}
	}
}
