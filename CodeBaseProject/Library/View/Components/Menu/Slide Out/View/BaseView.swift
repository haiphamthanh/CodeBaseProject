//
//  BaseView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 20/04/2022.
//

/// https://www.youtube.com/watch?v=0HEYo3QRDfA

import SwiftUI

struct BaseView: View {
	@State var showMenu: Bool = false
	
	// Hidding native one...
	init() {
		UITabBar.appearance().isHidden = true
	}
	
	@State var currentTab = "Home"
	
	var body: some View {
		
		let sideBarWidth = currentRect().width - 90
		
		// Whole navigation view...
		NavigationView {
			HStack(spacing: 0) {
				// Side menu...
				SideMenu(showMenu: $showMenu)
				
				// Main tab View
				VStack(spacing: 0) {
					TabView(selection: $currentTab) {
						Text("Home")
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
				.frame(width: currentRect().width)
			}
			// max Size...
			.frame(width: currentRect().width + sideBarWidth)
			.offset(x: -sideBarWidth / 2)
			// No navigation bar title
			// Hidding navigation bar
			.navigationBarTitleDisplayMode(.inline)
			.navigationBarHidden(true)
		}
	}
	
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

struct BaseView_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			BaseView()
		}
	}
}
