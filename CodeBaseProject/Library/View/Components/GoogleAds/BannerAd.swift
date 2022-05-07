//
//  BannerAd.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 07/05/2022.
//
/// https://developers.google.com/admob/ios/quick-start
/// https://www.youtube.com/watch?v=h7O0e_lGkL8

import SwiftUI
import GoogleMobileAds

struct BannerAd: UIViewRepresentable {
	var unitId: String
	
	func makeCoordinator() -> Coordinator {
		// For implementing delegate....
		return Coordinator()
	}
	
	func makeUIView(context: Context) -> GADBannerView {
		// Get size at https://developers.google.com/admob/ios/banner
		let adView = GADBannerView(adSize: GADAdSizeBanner)
		
		/// https://developers.google.com/admob/ios/banner#load_an_ad
		adView.adUnitID = unitId
		adView.rootViewController = AppCenter.shared.navigationVC
		adView.delegate = context.coordinator
		adView.load(GADRequest())
		
		return adView
	}
	
	func updateUIView(_ uiView: UIViewType, context: Context) {
		
	}
	
	/// https://developers.google.com/admob/ios/banner#ad_events
	class Coordinator: NSObject, GADBannerViewDelegate {
		func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
		  print("bannerViewDidReceiveAd")
		}

		func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
		  print("bannerView:didFailToReceiveAdWithError: \(error.localizedDescription)")
		}

		func bannerViewDidRecordImpression(_ bannerView: GADBannerView) {
		  print("bannerViewDidRecordImpression")
		}

		func bannerViewWillPresentScreen(_ bannerView: GADBannerView) {
		  print("bannerViewWillPresentScreen")
		}

		func bannerViewWillDismissScreen(_ bannerView: GADBannerView) {
		  print("bannerViewWillDIsmissScreen")
		}

		func bannerViewDidDismissScreen(_ bannerView: GADBannerView) {
		  print("bannerViewDidDismissScreen")
		}
	}
}
