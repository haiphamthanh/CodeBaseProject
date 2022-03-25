//
//  TextShimmer.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 25/03/2022.
//

import SwiftUI

//struct TextShimmer: View {
//
//	var text: String
//	@State var animation = false
//
//	var body: some View{
//
//		ZStack{
//
//			Text(text)
//				.font(.customFont(size: 25, weight: .semibold))
//				.foregroundColor(Color.red600.opacity(0.6))
//
//			// MultiColor Text....
//
//			HStack(spacing: 0){
//
//				ForEach(0..<text.count,id: \.self){index in
//
//					Text(String(text[text.index(text.startIndex, offsetBy: index)]))
//						.font(.customFont(size: 25, weight: .semibold))
//						.foregroundColor(randomColor())
//				}
//			}
//			// Masking For Shimmer Effect...
//			.mask(
//
//				Rectangle()
//					// For Some More Nice Effect Were Going to use Gradient...
//					.fill(
//
//						// You can use any Color Here...
//						LinearGradient(gradient: .init(colors: [Color.white.opacity(0.5),Color.white,Color.white.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
//					)
//					.rotationEffect(.init(degrees: 70))
//					//                    .padding(20)
//					// Moving View Continously...
//					// so it will create Shimmer Effect...
//					.offset(x: -250)
//					.offset(x: animation ? 500 : 0)
//			)
//			.onAppear(perform: {
//
//				withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)){
//
//					animation.toggle()
//				}
//			})
//		}
//	}
//
//	// Random Color....
//
//	// It's Your Wish yOu can change anything here...
//	// or you can also use Array of colors to pick random One....
//
//	func randomColor()->Color{
//
//		let color = UIColor(red: 1, green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
//
//		return Color(color)
//	}
//}
