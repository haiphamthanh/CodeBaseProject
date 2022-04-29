//
//  TabBarContainView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 22/04/2022.
//

import SwiftUI

struct TabBarContainView: View {
	@Binding var currentTab: TabbarType
	
	var body: some View {
		// Main tab View
		VStack(spacing: 0) {
			TabView(selection: $currentTab) {
				TabBarManager.shared.topHomeView
					.navigationBarTitleDisplayMode(.inline)
					.navigationBarHidden(true)
					.tag(TabbarType.home)
				
				TopSearchView()
					.navigationBarTitleDisplayMode(.inline)
					.navigationBarHidden(true)
					.tag(TabbarType.search)
				
				TopNotificationView()
					.navigationBarTitleDisplayMode(.inline)
					.navigationBarHidden(true)
					.tag(TabbarType.noti)
				
				TopVideoView()
					.navigationBarTitleDisplayMode(.inline)
					.navigationBarHidden(true)
					.tag(TabbarType.video)
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
		
		Button {
			withAnimation{ currentTab = tabbarType }
		} label: {
			Image(image)
				.resizable()
				.renderingMode(.template)
				.aspectRatio(contentMode: .fit)
				.frame(width: 23, height: 22)
				.foregroundColor(currentTab == tabbarType ? .primary : .gray)
				.frame(maxWidth: .infinity)
		}
	}
}

#if DEBUG
struct TabBarContainView_Previews: PreviewProvider {
	static var previews: some View {
		SlideOutMenu(showMenu: .constant(false),
					 menuOutput: .constant(MenuType.none),
					 currentTab: .constant(TabbarType.home))
	}
}
#endif
