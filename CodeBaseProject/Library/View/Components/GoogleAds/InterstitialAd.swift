//
//  InterstitialAd.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 08/05/2022.
//
/// https://developers.google.com/admob/ios/interstitial
/// https://stackoverflow.com/questions/68168522/implementing-admob-interstitial-ads-in-swiftui-5-and-xcode-12-4
/// https://quangcaosieutoc.com/quang-cao-di-dong-interstitial-la-gi/#:~:text=Theo%20%C4%91%E1%BB%8Bnh%20ngh%C4%A9a%20ch%C3%ADnh%20th%E1%BB%91ng,n%E1%BB%99i%20dung%20m%C3%ACnh%20mu%E1%BB%91n%20xem.

import SwiftUI
import GoogleMobileAds
import AppTrackingTransparency
import AdSupport

class AdsManager: NSObject, ObservableObject {
	private struct AdMobConstant {
		static let interstitial1ID = "ca-app-pub-3940256099942544/4411468910"
	}
	
	final class Interstitial: NSObject, GADFullScreenContentDelegate, ObservableObject {
		
		private var interstitial: GADInterstitialAd?
		
		override init() {
			super.init()
			requestInterstitialAds()
		}
		
		func requestInterstitialAds() {
			let request = GADRequest()
			request.scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
			ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
				GADInterstitialAd.load(withAdUnitID: AdMobConstant.interstitial1ID, request: request, completionHandler: { [self] ad, error in
					if let error = error {
						print("Failed to load interstitial ad with error: \(error.localizedDescription)")
						return
					}
					interstitial = ad
					interstitial?.fullScreenContentDelegate = self
				})
			})
		}
		
		func showAd() {
			let root = AppCenter.shared.navigationVC
			if let fullScreenAds = interstitial {
				fullScreenAds.present(fromRootViewController: root!)
			} else {
				print("not ready")
			}
		}
		
	}
	
	
}
