//
//  TopVideoView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 22/04/2022.
//

import SwiftUI

struct TopVideoView: View {
	var body: some View {
		VStack {
			Text(TabbarType.video.info.name)
			Spacer()
		}
	}
}

#if DEBUG
struct TopVideoView_Previews: PreviewProvider {
	static var previews: some View {
		TopVideoView()
	}
}
#endif
