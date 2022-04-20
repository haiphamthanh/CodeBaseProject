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
		Button {
			withAnimation{ showMenu.toggle() }
		} label: {
			Text("Show menu")
		}
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        SlideOutMenu()
    }
}
