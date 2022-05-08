//
//  GoogleAdProvider.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 08/05/2022.
//

import Foundation
import SwiftUI

class GoogleAdProvider {
	static func banner(with adUnitID: String) -> AnyView {
		return AnyView(BannerAd(adUnitID: adUnitID))
	}
	
	static func showInterstitial(with adUnitID: String) {
		return InterstitialAd.shared.show(adUnitID: adUnitID)
	}
	
	// Native Ad
	// Rewarded Ad
}
