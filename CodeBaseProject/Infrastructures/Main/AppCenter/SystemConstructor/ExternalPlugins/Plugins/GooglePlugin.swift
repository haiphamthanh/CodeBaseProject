//
//  GooglePlugin.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 08/04/2022.
//

import GoogleMobileAds

class GooglePlugin {
	func setup() {
		startAd()
	}
}

extension GooglePlugin {
	func startAd() {
		GADMobileAds.sharedInstance().start(completionHandler: nil)
	}
}
