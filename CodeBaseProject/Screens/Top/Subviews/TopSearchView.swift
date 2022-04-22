//
//  TopSearchView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 22/04/2022.
//

import SwiftUI

struct TopSearchView: View {
	var body: some View {
		VStack {
			Text(TabbarType.search.info.name)
			Spacer()
		}
	}
}

#if DEBUG
struct TopSearchView_Previews: PreviewProvider {
	static var previews: some View {
		TopSearchView()
	}
}
#endif
