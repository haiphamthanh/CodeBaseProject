//
//  SlideOutMenu.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 20/04/2022.
//

/// https://www.youtube.com/watch?v=0HEYo3QRDfA
///
///

import SwiftUI

struct SlideOutMenu: View {
	/// Menu handler
	@Binding var showMenu: Bool
	@Binding var menuOutput: MenuType
	@Binding var currentTab: TabbarType
	
	var body: some View {
		SlideOutContainView(showMenu: $showMenu,
							currentTab: $currentTab,
							menuOutput: $menuOutput)
	}
}

#if DEBUG
struct SlideOutMenu_Previews: PreviewProvider {
	static var previews: some View {
		SlideOutMenu(showMenu: .constant(true),
					 menuOutput: .constant(MenuType.none),
					 currentTab: .constant(TabbarType.home))
	}
}
#endif
