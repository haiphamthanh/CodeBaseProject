//
//  TextShimmer.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 25/03/2022.
//

import SwiftUI

struct TextShimmer: View {
	@State var viewInput: TextShimmerInput
	@State var animation = false
	
	var body: some View{
		ZStack{
			
			Text(viewInput.text)
				.font(.customFont(size: 25, weight: .semibold))
				.foregroundColor(Color.red600.opacity(0.6))
			
			// MultiColor Text....
			
			HStack(spacing: 0){
				
				ForEach(0..<viewInput.text.count,id: \.self){index in
					
					Text(String(viewInput.text[viewInput.text.index(viewInput.text.startIndex, offsetBy: index)]))
						.font(.customFont(size: 25, weight: .semibold))
						.foregroundColor(Color.randomColor)
				}
			}
			// Masking For Shimmer Effect...
			.mask(
				
				Rectangle()
				// For Some More Nice Effect Were Going to use Gradient...
					.fill(
						
						// You can use any Color Here...
						LinearGradient(gradient: .init(colors: [Color.white.opacity(0.5),Color.white,Color.white.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
					)
					.rotationEffect(.init(degrees: 70))
				//                    .padding(20)
				// Moving View Continously...
				// so it will create Shimmer Effect...
					.offset(x: -250)
					.offset(x: animation ? 500 : 0)
			)
			.onAppear(perform: {
				
				withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)){
					
					animation.toggle()
				}
			})
		}
	}
}
