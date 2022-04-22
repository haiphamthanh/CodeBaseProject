//
//  MenuContainView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 22/04/2022.
//

import SwiftUI

struct MenuContainView: View {
    var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			VStack(alignment: .leading, spacing: 45) {
				// Tab buttons
				MenuButton(title: "Home", image: "ic_home")
				MenuButton(title: "Camera", image: "ic_camera")
				MenuButton(title: "Cart", image: "ic_cart")
				MenuButton(title: "Setting", image: "ic_setting")
				MenuButton(title: "Home", image: "ic_home")
				MenuButton(title: "Camera", image: "ic_camera")
				MenuButton(title: "Cart", image: "ic_cart")
				MenuButton(title: "Setting", image: "ic_setting")
			}
			.padding()
			.padding(.leading)
			.padding(.top, 45)
			
			Divider()
			
			MenuButton(title: "Facebook", image: "ic_facebook")
				.padding()
				.padding(.leading)
			
			Divider()
			
			VStack(alignment: .leading, spacing: 25) {
				Button("Setting And Privacy") {
					
				}
				
				Button("Help Center") {
					
				}
			}
			.padding()
			.padding(.leading)
			.padding(.bottom)
			.frame(maxWidth: .infinity, alignment: .leading)
			.foregroundColor(.primary)
		}
    }
}

// MARK: - >>>>>>>>>>>> View Builder
private extension MenuContainView {
	@ViewBuilder
	func MenuButton(title: String, image: String) -> some View {
		NavigationLink {
			Text("\(title) View")
				.navigationTitle(title)
		} label: {
			HStack(spacing: 14) {
				Image(image)
					.resizable()
					.renderingMode(.template)
					.aspectRatio(contentMode: .fill)
					.frame(width: 22, height: 22)
				Text(title)
			}
			.foregroundColor(.primary)
			.frame(maxWidth: .infinity, alignment: .leading)
		}
	}
}

struct MenuContainView_Previews: PreviewProvider {
    static var previews: some View {
		MenuContainView()
    }
}
