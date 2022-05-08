//
//  ToolbarViewModifier.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 02/05/2022.
//

import SwiftUI

//<-- Important!!! Export to use as utils
extension View {
	func customToolbar(isShowingMenu: Binding<Bool>) -> some View {
		self.modifier(ToolbarViewModifier(isShowingMenu: isShowingMenu))
	}
}

struct ToolbarViewModifier: ViewModifier {
	@Binding private var isShowingMenu: Bool
	
	public init(isShowingMenu: Binding<Bool>) {
		_isShowingMenu = isShowingMenu
	}
	
	func body(content: Content) -> some View {
		content.toolbar {
			ToolbarItem(placement: .navigationBarLeading) {
				Button(action: {
					isShowingMenu = true
				}) {
					HStack {
						Image(systemName: "arrow.left")
							.frame(width: 24, height: 24)
							.background(
								Circle()
									.fill(Color.red)
							)
							.shadow(color: Color.black.opacity(0.3), radius: 3, x: 2, y: 2)
						
						Text("Back") // without this text the image formatting will not show
					}
				}
			}
		}
	}
}
