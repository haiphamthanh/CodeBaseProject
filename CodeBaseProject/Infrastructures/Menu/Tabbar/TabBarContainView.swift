//
//  TabBarContainView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 22/04/2022.
//

import SwiftUI

struct TabBarContainView: View {
	@Binding var showMenu: Bool
	@Binding var currentTab: String
	
	var body: some View {
		// Main tab View
		VStack(spacing: 0) {
			TabView(selection: $currentTab) {
				TopHomeView(isAvatarPressed: $showMenu)
					.navigationBarTitleDisplayMode(.inline)
					.navigationBarHidden(true)
					.tag("ic_home")
				
				
				Text("Search")
					.navigationBarTitleDisplayMode(.inline)
					.navigationBarHidden(true)
					.tag("ic_camera")
				
				Text("Notifications")
					.navigationBarTitleDisplayMode(.inline)
					.navigationBarHidden(true)
					.tag("ic_setting")
				
				Text("Messages")
					.navigationBarTitleDisplayMode(.inline)
					.navigationBarHidden(true)
					.tag("ic_cart")
			}
			
			// Custom tab bar...
			VStack(spacing: 0) {
				Divider()
				
				HStack(spacing: 0) {
					// Tab bar button
					TabButton(image: "ic_home")
					TabButton(image: "ic_camera")
					TabButton(image: "ic_setting")
					TabButton(image: "ic_cart")
				}
				.padding([.top], 15)
			}
			
		}
	}
}

// MARK: - >>>>>>>>>>>> View Builder
private extension TabBarContainView {
	@ViewBuilder
	func TabButton(image: String) -> some View {
		Button {
			withAnimation{ currentTab = image }
		} label: {
			Image(image)
				.resizable()
				.renderingMode(.template)
				.aspectRatio(contentMode: .fit)
				.frame(width: 23, height: 22)
				.foregroundColor(currentTab == image ? .primary : .gray)
				.frame(maxWidth: .infinity)
		}
	}
}

struct TabBarContainView_Previews: PreviewProvider {
	static var previews: some View {
		SlideOutMenu()
	}
}
