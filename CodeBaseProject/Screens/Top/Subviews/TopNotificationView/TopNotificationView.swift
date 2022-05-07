//
//  TopNotificationView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 22/04/2022.
//

import SwiftUI

// ViewModel ===> View
protocol TopNotificationViewModelViewSupport: AnyObject {
}

struct TopNotificationView {
	private init() { }
}

// Properties is used for View
extension TopNotificationView {
	class IProps: DefaultIProps<TopNotificationViewModelViewSupport>, ObservableObject {
	}
}

// MARK: - ================================= View Layout =================================
extension TopNotificationView {
	struct IView: View, ViewRule {
		// MARK: Properties
		@ObservedObject var props: IProps
		
		// MARK: Layout
		var body: some View {
			VStack {
				InterstitialAd()
			}
		}
	}
}


#if DEBUG
struct TopNotificationView_Previews: PreviewProvider {
	static var previews: some View {
		let viewModel = TopViewModelImpl()
		let props = TopNotificationView.IProps(viewModel: viewModel)
		AnyView(TopNotificationView.IView(props: props))
	}
}
#endif


/// https://www.youtube.com/watch?v=h7O0e_lGkL8
struct BannerAddView: View {
	var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			let adPlacement: Int = 5
			VStack(spacing: 20) {
				ForEach(1...25, id:\.self) { index in
					// Card view
					CardView(index: index)
					
					if (index % adPlacement) == 0 {
						BannerAd(unitId: "ca-app-pub-3940256099942544/2934735716")
					}
				}
			}
		}
		.padding()
	}
	
	@ViewBuilder
	func CardView(index: Int) -> some View {
		VStack(alignment: .leading, spacing: 12) {
			GeometryReader { proxy in
				let size = proxy.size
				Image("image1")
					.resizable()
					.aspectRatio(contentMode: .fill)
					.frame(width: size.width, height: size.height)
					.cornerRadius(15)
			}
			.frame(height: 250)
		}
	}
}


import GoogleMobileAds

/// https://www.youtube.com/watch?v=h7O0e_lGkL8
struct InterstitialAd: View {
	@EnvironmentObject var adsVM: AdsViewModel
	
	var body: some View {
		Button {
			adsVM.showInterstitial = true
		} label: {
			Text("Show")
		}
	}
}
