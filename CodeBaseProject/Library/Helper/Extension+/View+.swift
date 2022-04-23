//
//  View+.swift
//  TBVCommunity
//
//  Created by D.Ace on 16/07/2021.
//

import SwiftUI

///  Extending View to support show alert...
extension View {
	func alert(by alertResponse: Binding<AppAlertData?>, completion: (() -> Void)? = nil) -> some View {
		self.alert(item: alertResponse, content: { alertResponse in
			return Alert(title: Text(alertResponse.title),
						 message: Text(alertResponse.message),
						 dismissButton: .default(Text("OK"),
												 action: alertResponse.completion ?? {} ))
		})
	}
	
	func alert(isPresented: Binding<Bool>, _ content: TextFieldAlert) -> some View {
		TextFieldWrapper(isPresented: isPresented, presentingView: self, content: content)
	}
}

///  Extending View to support pull to request
extension View {
	public func pullToRefresh(isShowing: Binding<Bool>, onRefresh: @escaping () -> Void) -> some View {
		return overlay(
			PullToRefresh(isShowing: isShowing, onRefresh: onRefresh)
				.frame(width: 0, height: 0)
		)
	}
}

///  Extending View to support making place holder
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

#if canImport(UIKit)
extension View {
	func hideKeyboard() {
		UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
	}
}
#endif

///  Extending View to get Screen Rect...
extension View {
	func currentScreenRect() -> CGRect {
		return UIScreen.main.bounds
	}
}
