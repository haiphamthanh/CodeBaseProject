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

//class InterstitialAdManager: ObservableObject {
//	static let shared = InterstitialAdManager()
//	private init() { }
//
//	@Published private var interstitial = InterstitialAd.Interstitial()
//	@Published var showInterstitial = false {
//		didSet {
//			if showInterstitial {
//				interstitial.showAd()
//				showInterstitial = false
//			} else {
//				interstitial.requestInterstitialAds()
//			}
//		}
//	}
//}
//
//class InterstitialAd: NSObject, ObservableObject {
//	private struct AdMobConstant {
//		static let interstitial1ID = "ca-app-pub-3940256099942544/4411468910"
//	}
//
//	class Interstitial: NSObject, GADFullScreenContentDelegate, ObservableObject {
//		let interstitial1ID = "ca-app-pub-3940256099942544/4411468910"
//
//		private var interstitial: GADInterstitialAd? {
//			didSet {
//				guard let fullScreenAds = interstitial else {
//					return print("not ready")
//				}
//
//				guard let root = AppCenter.shared.navigationVC else {
//					return print("not ready")
//				}
//
//				return fullScreenAds.present(fromRootViewController: root)
//			}
//		}
//
//		func requestInterstitialAds(adUnitID: String) {
//			let request = GADRequest()
//			request.scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
//			ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
//				GADInterstitialAd.load(withAdUnitID: AdMobConstant.interstitial1ID, request: request, completionHandler: { [self] ad, error in
//					if let error = error {
//						print("Failed to load interstitial ad with error: \(error.localizedDescription)")
//						return
//					}
//					interstitial = ad
//					interstitial?.fullScreenContentDelegate = self
//				})
//			})
//		}
//	}
//
//
//}

class InterstitialAd: NSObject, ObservableObject {
	static let shared = InterstitialAd()
	private override init() { }
	//	let interstitial1ID = "ca-app-pub-3940256099942544/4411468910"
	
	private var interstitial: GADInterstitialAd? {
		didSet {
			guard let fullScreenAds = interstitial else {
				return print("not ready")
			}
			
			guard let root = AppCenter.shared.navigationVC else {
				return print("not ready")
			}
			
			return fullScreenAds.present(fromRootViewController: root)
		}
	}
	
	func show(adUnitID: String) {
		let request = GADRequest()
		//		request.scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
		ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
			GADInterstitialAd.load(withAdUnitID: adUnitID,
								   request: request,
								   completionHandler: { [self] ad, error in
				if let error = error {
					print("Failed to load interstitial ad with error: \(error.localizedDescription)")
					return
				}
				
				ad?.fullScreenContentDelegate = self
				interstitial = ad
			})
		})
	}
}

extension InterstitialAd: GADFullScreenContentDelegate {
	/// Tells the delegate that the ad failed to present full screen content.
	func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
		print("Ad did fail to present full screen content.")
	}
	
	/// Tells the delegate that the ad will present full screen content.
	func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
		print("Ad will present full screen content.")
		ModelIdTreeManager.shared.lockModel()
	}
	
	/// Tells the delegate that the ad dismissed full screen content.
	func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
		print("Ad did dismiss full screen content.")
		ModelIdTreeManager.shared.unLockModel()
	}
	
}
