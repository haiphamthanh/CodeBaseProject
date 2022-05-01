//
//  MainContainerView_A.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 20/04/2022.
//

/// https://www.youtube.com/watch?v=0HEYo3QRDfA
/// Main view built on side menu and tab bar
///

import SwiftUI

struct MainContainerView_A: View {
	/// Menu handler
	@State private var isShowingMenu: Bool = false
	@Binding var menuOutput: MenuType
	@Binding var currentTab: TabbarType
	
	var body: some View {
		let currentScreenWidth = currentScreenRect().width
		let sideBarWidth = currentScreenWidth - 90
		
		VStack {
		}
		.sideMenuWithTabbar(isShowingMenu: $isShowingMenu) {
			SideMenuView(sideBarWidth: sideBarWidth,
						 output: $menuOutput.onUpdate(didSelectedMenu(_:)))
		} tabbarContent: {
			TabBarContainView(currentTab: $currentTab)
		}
	}
	
	private func didSelectedMenu(_ menu: MenuType) {
		isShowingMenu = false
	}
}


#if DEBUG
struct MainContainerView_A_Previews: PreviewProvider {
	static var previews: some View {
		MainContainerView_A(menuOutput: .constant(MenuType.none),
							currentTab: .constant(TabbarType.home))
	}
}
#endif
