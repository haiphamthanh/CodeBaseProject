//
//  TopHomeView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 21/04/2022.
//

import SwiftUI

struct TopHomeView: View {
	@Binding var touchedAvatar: Bool
	@Binding var touchedSetting: Bool
	
	var body: some View {
		VStack {
			ExNavigationBarView(touchedAvatar: $touchedAvatar, touchedSetting: $touchedSetting)
			
			Spacer()
		}
	}
}

#if DEBUG
struct TopHomeView_Previews: PreviewProvider {
	static var previews: some View {
		TopHomeView(touchedAvatar: .constant(false), touchedSetting: .constant(false))
	}
}
#endif
