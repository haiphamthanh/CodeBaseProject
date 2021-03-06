//
//  SingleView.swift
//  TBVCommunity
//
//  Created by HaiKaito on 14/07/2021.
// https://www.youtube.com/watch?v=KYokxl1inRs
// https://betterprogramming.pub/creating-an-apple-like-splash-screen-in-swiftui-fdeb36b47e81
// https://mobiraft.com/ios/swiftui/how-to-add-splash-screen-in-swiftui/
//

import SwiftUI

struct SingleView<InputType>: View where InputType: SingleViewInput {
	@ObservedObject private var viewInput: InputType
	
	init(viewInput: InputType) {
		self.viewInput = viewInput
	}
	
	// Implement data with viewInput
	var body: some View {
		Text("Hello, world!")
			.padding()
		//		ZStack(alignment: .center) {
		//			Color(.backgroundColor)
		//				.edgesIgnoringSafeArea(.all)
		//			VStack(alignment: .center) {
		//				Spacer()
		//				LogoImageView()
		//					.frame(width: 500 ,height: 100)
		//				Spacer()
		//				Spacer().frame(height: 100)
		//			}
		//
		//			VStack {
		//				Spacer()
		//				TextShimmer(text: "Welcome back!")
		//					.padding(.bottom, 40)
		//			}
		//		}.edgesIgnoringSafeArea(.all)
	}
}
