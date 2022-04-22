//
//  Home.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 21/04/2022.
//

import SwiftUI

struct Home: View {
	@Binding var showMenu: Bool
	var body: some View {
		VStack {
			ExNavigationBarView(showMenu: $showMenu)
			
			Spacer()
		}
	}
}

struct Home_Previews: PreviewProvider {
	static var previews: some View {
		SlideOutMenu()
	}
}
