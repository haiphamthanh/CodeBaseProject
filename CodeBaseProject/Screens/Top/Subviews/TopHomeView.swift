//
//  TopHomeView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 21/04/2022.
//

import SwiftUI

struct TopHomeView: View {
	@Binding var isAvatarPressed: Bool
	var body: some View {
		VStack {
			ExNavigationBarView(isAvatarPressed: $isAvatarPressed)
			
			Spacer()
		}
	}
}

struct TopHomeView_Previews: PreviewProvider {
	static var previews: some View {
		SlideOutMenu()
	}
}
