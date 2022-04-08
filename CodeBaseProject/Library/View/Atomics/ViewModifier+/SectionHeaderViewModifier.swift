//
//  SectionHeaderViewModifier.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 05/04/2022.
//

import SwiftUI

struct SectionHeaderViewModifier: ViewModifier {
	func body(content: Content) -> some View {
		Group {
			if #available(iOS 14, *) {
				AnyView(content.textCase(.none))
			} else {
				content
			}
		}
	}
}
