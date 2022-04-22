//
//  TopNotificationView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 22/04/2022.
//

import SwiftUI

struct TopNotificationView: View {
	var body: some View {
		VStack {
			Text(TabbarType.noti.info.name)
			Spacer()
		}
	}
}

#if DEBUG
struct TopNotificationView_Previews: PreviewProvider {
	static var previews: some View {
		TopNotificationView()
	}
}
#endif
