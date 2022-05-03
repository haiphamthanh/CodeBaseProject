//
//  MenuFooter.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 22/04/2022.
//

import SwiftUI

struct MenuFooter: View {
	var body: some View {
		VStack(spacing: 0) {
			Divider()
			
			HStack {
				Button {
					// Button titlte
				} label: {
					Image("ic_home")
						.resizable()
						.renderingMode(.template)
						.aspectRatio(contentMode: .fill)
						.frame(width: 22, height: 22)
				}
				
				Spacer()
				
				Button {
					// Button titlte
				} label: {
					Image("ic_setting")
						.resizable()
						.renderingMode(.template)
						.aspectRatio(contentMode: .fill)
						.frame(width: 22, height: 22)
				}
			}
			.padding([.horizontal, .top], 15)
			.padding(.bottom, appBottomPadding)
			.foregroundColor(.primary)
		}
	}
}


#if DEBUG
struct MenuFooter_Previews: PreviewProvider {
	static var previews: some View {
		MenuFooter()
	}
}
#endif