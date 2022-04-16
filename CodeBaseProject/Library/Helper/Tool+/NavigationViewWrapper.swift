//
//  NavigationViewWrapper.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 17/04/2022.
//

import SwiftUI

struct NavigationViewWrapper: View {
	// MARK: Properties
	private var containView: AnyView
	init(containView: AnyView) {
		self.containView = containView
	}
	
	// MARK: Layout
	var body: some View {
		Group {
			NavigationView { containView }
				.navigationViewStyle(StackNavigationViewStyle())
		}
	}
}
