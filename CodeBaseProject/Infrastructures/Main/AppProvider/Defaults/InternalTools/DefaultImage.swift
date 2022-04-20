//
//  DefaultImage.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 09/04/2022.
//

import UIKit

class DefaultImage {
}

// MARK: - ########################## Final ##########################
extension DefaultImage: ImageProvider {
	var logo: UIImage {
		return UIImage.Asset.ic_logo.image
	}
	
	var leftMenuIcon: UIImage {
		return UIImage.Asset.ic_menu_left.image
	}
	
	var rightMenuIcon: UIImage {
		return UIImage.Asset.ic_menu_right.image
	}
	
	var intros: [UIImage] {
		return [UIImage.Asset.ic_intro_bg_1.image,
				UIImage.Asset.ic_intro_bg_2.image,
				UIImage.Asset.ic_intro_bg_3.image,
				UIImage.Asset.ic_intro_bg_4.image,
				UIImage.Asset.ic_intro_bg_5.image,
				UIImage.Asset.ic_intro_bg_6.image]
	}
	
	var tabbars: [UIImage] {
		return [UIImage.Asset.ic_tabbar_home.image,
				UIImage.Asset.ic_tabbar_news.image,
				UIImage.Asset.ic_tabbar_video.image]
	}
	
	var avatar: UIImage {
		return UIImage.Asset.ic_profile_avatar.image
	}
}

// MARK: - ########################## Private ##########################
private extension UIImage {
	enum Asset: String {
		// Logo
		case ic_logo = "ic_logo"
		
		// Menu
		case ic_menu_left = "ic_menu_left"
		case ic_menu_right = "ic_menu_right"
		
		// Intro
		case ic_intro_bg_1 = "ic_intro_bg_1"
		case ic_intro_bg_2 = "ic_intro_bg_2"
		case ic_intro_bg_3 = "ic_intro_bg_3"
		case ic_intro_bg_4 = "ic_intro_bg_4"
		case ic_intro_bg_5 = "ic_intro_bg_5"
		case ic_intro_bg_6 = "ic_intro_bg_6"
		
		// Home
		case ic_tabbar_home = "ic_tabbar_home"
		case ic_tabbar_news = "ic_tabbar_news"
		case ic_tabbar_video = "ic_tabbar_video"
		
		// User Profile
		case ic_profile_avatar = "ic_avatar_profile"
		
		var image: UIImage {
			return UIImage(asset: self)
		}
	}
	
	convenience init!(asset: Asset) {
		self.init(named: asset.rawValue)
	}
}
