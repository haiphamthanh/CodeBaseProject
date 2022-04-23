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
	@Binding var menuOutput: MenuType
	@Binding var actionOther: OtherType
	
	var body: some View {
		SlideOutContainView(menuOutput: $menuOutput, actionOther: $actionOther)
	}
}

#if DEBUG
struct SlideOutMenu_Previews: PreviewProvider {
	static var previews: some View {
		SlideOutMenu(menuOutput: .constant(MenuType.none),
					 actionOther: .constant(OtherType.none))
	}
}
#endif
