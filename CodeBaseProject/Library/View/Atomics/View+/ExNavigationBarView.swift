//
//  ExNavigationBarView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 22/04/2022.
//

import SwiftUI

struct ExNavigationBarView: View {
	@Binding var touchedAvatar: Bool
	@Binding var touchedSetting: Bool
	
	@ViewBuilder
	var body: some View {
		VStack(spacing: 0) {
			HStack {
				Button {
					withAnimation {
						touchedAvatar.toggle()
					}
				} label: {
					Image(Asset.Assets.imgMyAvatar)
						.resizable()
						.aspectRatio(contentMode: .fill)
						.frame(width: 35, height: 35)
						.clipShape(Circle())
				}
				
				Spacer()
				
				
				Button {
					withAnimation {
						touchedSetting.toggle()
					}
				} label: {
					Image("ic_setting")
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
			Image("ic_home")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 25, height: 25)
		)
	}
}

#if DEBUG
struct ExNavigationBarView_Previews: PreviewProvider {
	static var previews: some View {
		ExNavigationBarView(touchedAvatar: .constant(false), touchedSetting: .constant(false))
	}
}
#endif
