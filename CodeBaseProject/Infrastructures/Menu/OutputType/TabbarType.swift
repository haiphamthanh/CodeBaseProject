//
//  TabbarType.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 23/04/2022.
//

import Foundation

enum TabbarType {
	case home
	case search
	case noti
	case video
	
	var info: (image: String, name: String) {
		switch self {
		case .home:
			return (image: "ic_home", name: "Home")
		case .search:
			return (image: "ic_camera", name: "Search")
		case .noti:
			return (image: "ic_setting", name: "Notifications")
		case .video:
			return (image: "ic_cart", name: "Messages")
		}
	}
}
