//
//  View+.swift
//  TBVCommunity
//
//  Created by D.Ace on 16/07/2021.
//

import SwiftUI
import Combine

extension View {
	func alert(by alertResponse: Binding<AppAlertModel?>, completion: (() -> Void)? = nil) -> some View {
		self.alert(item: alertResponse, content: { alertResponse in
			return Alert(title: Text(alertResponse.title),
						 message: Text(alertResponse.message),
						 dismissButton: .default(Text("OK"),
												 action: alertResponse.completion ?? {} ))
		})
	}
}

extension View {
	public func pullToRefresh(isShowing: Binding<Bool>, onRefresh: @escaping () -> Void) -> some View {
		return overlay(
			PullToRefresh(isShowing: isShowing, onRefresh: onRefresh)
				.frame(width: 0, height: 0)
		)
	}
}


extension View {
	func placeholder<Content: View>(
		when shouldShow: Bool,
		alignment: Alignment = .leading,
		@ViewBuilder placeholder: () -> Content) -> some View {
			
			ZStack(alignment: alignment) {
				placeholder().opacity(shouldShow ? 0.5 : 0)
				self
			}
		}
}

extension View {
	func alert(isPresented: Binding<Bool>, _ content: TextFieldAlert) -> some View {
		TextFieldWrapper(isPresented: isPresented, presentingView: self, content: content)
	}
}

#if canImport(UIKit)
extension View {
	func hideKeyboard() {
		UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
	}
}
#endif
