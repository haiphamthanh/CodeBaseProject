//
//  MenuType.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 23/04/2022.
//

import Foundation

enum MenuType {
	case home
	case search
	case noti
	case video
	case facebook
	case privacy
	case help
	case none
	
	var info: (image: String?, name: String)? {
		switch self {
		case .home:
			return (image: "ic_home", name: "Home")
		case .search:
			return (image: "ic_camera", name: "Search")
		case .noti:
			return (image: "ic_setting", name: "Notifications")
		case .video:
			return (image: "ic_cart", name: "Messages")
		case .facebook:
			return (image: "ic_facebook", name: "Facebook")
		case .privacy:
			return (image: nil, name: "Setting And Privacy")
		case .help:
			return (image: nil, name: "Help Center")
		case .none:
			return nil
		}
	}
}
