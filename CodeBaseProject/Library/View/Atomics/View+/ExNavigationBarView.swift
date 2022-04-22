//
//  ExNavigationBarView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 22/04/2022.
//

import SwiftUI

struct ExNavigationBarView: View {
	@Binding var isAvatarPressed: Bool
	
	@ViewBuilder
	var body: some View {
		VStack(spacing: 0) {
			HStack {
				Button {
					withAnimation {
						isAvatarPressed.toggle()
					}
				} label: {
					Image("img_my_avatar")
						.resizable()
						.aspectRatio(contentMode: .fill)
						.frame(width: 35, height: 35)
						.clipShape(Circle())
				}
				
				Spacer()
				
				// Navigation Link...
				NavigationLink {
					Text("Time line view")
						.navigationTitle("Time line")
				} label: {
					Image("ic_home")
						.resizable()
						.renderingMode(.template)
						.aspectRatio(contentMode: .fit)
						.frame(width: 22, height: 22)
						.foregroundColor(.primary)
				}
			}
			.padding(.horizontal)
			.padding(.vertical, 10)
			
			Divider()
		}
		.overlay(
			Image("ic_setting")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 25, height: 25)
		)
	}
}

#if DEBUG
struct ExNavigationBarView_Previews: PreviewProvider {
	static var previews: some View {
		ExNavigationBarView(isAvatarPressed: .constant(true))
	}
}
#endif
