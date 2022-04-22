//
//  TabBarContainView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 22/04/2022.
//

import SwiftUI

enum TabbarType: String {
	case home
	case search
	case noti
	case video
	
	var info: (image: String, tag: String, name: String) {
		switch self {
		case .home:
			return (image: "ic_home", tag: "home", name: "Home")
		case .search:
			return (image: "ic_camera", tag: "search", name: "Search")
		case .noti:
			return (image: "ic_setting", tag: "notification", name: "Notifications")
		case .video:
			return (image: "ic_cart", tag: "message", name: "Messages")
		}
	}
}

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
					.tag(TabbarType.home.info.tag)
				
				TopSearchView()
					.navigationBarTitleDisplayMode(.inline)
					.navigationBarHidden(true)
					.tag(TabbarType.search.info.tag)
				
				TopNotificationView()
					.navigationBarTitleDisplayMode(.inline)
					.navigationBarHidden(true)
					.tag(TabbarType.noti.info.tag)
				
				TopVideoView()
					.navigationBarTitleDisplayMode(.inline)
					.navigationBarHidden(true)
					.tag(TabbarType.video.info.tag)
			}
			
			// Custom tab bar...
			VStack(spacing: 0) {
				Divider()
				
				HStack(spacing: 0) {
					// Tab bar button
					TabbarButton(.home)
					TabbarButton(.search)
					TabbarButton(.noti)
					TabbarButton(.video)
				}
				.padding([.top], 15)
				.padding(.bottom, appBottomPadding)
			}
		}
	}
}

// MARK: - >>>>>>>>>>>> View Builder
private extension TabBarContainView {
	@ViewBuilder
	func TabbarButton(_ tabbarType: TabbarType) -> some View {
		let tabbarInfo = tabbarType.info
		let image = tabbarInfo.image
		let identify = tabbarInfo.tag
		
		Button {
			withAnimation{ currentTab = identify }
		} label: {
			Image(image)
				.resizable()
				.renderingMode(.template)
				.aspectRatio(contentMode: .fit)
				.frame(width: 23, height: 22)
				.foregroundColor(currentTab == identify ? .primary : .gray)
				.frame(maxWidth: .infinity)
		}
	}
}

struct TabBarContainView_Previews: PreviewProvider {
	static var previews: some View {
		SlideOutMenu()
	}
}
