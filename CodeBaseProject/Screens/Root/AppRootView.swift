//
//  AppRootView.swift
//  TBVCommunity
//
//  Created by HaiKaito on 13/07/2021.
//

import SwiftUI

// MARK: - ================================= View input requirements =================================
protocol AppRootViewDataPolicy: ObservableObject {
	var appState: AppState { get }
	var email: String { get set }
	var mail: String { get set }
}

extension AppRootViewModel: AppRootViewDataPolicy {
	var mail: String {
		get { email }
		set { email = newValue }
	}
}

// MARK: - ================================= View Layout =================================
struct AppRootView<VM: AppRootViewDataPolicy>: View, ViewRule where VM: ViewModelRule {
	// MARK: Properties
	@ObservedObject var viewModel: VM
	
	// MARK: Init
	init(viewModel: VM) {
		self.viewModel = viewModel
	}
	
	// MARK: Layout
	var body: some View {
		Text(viewModel.email)
		AppTextField(text: $viewModel.mail,
					 textPlaceholder: "Text")
		.frame(minWidth: 280, maxWidth: 400, idealHeight: 35, alignment: .leading)
		.padding(.horizontal, 40)
		.keyboardType(.emailAddress)
		.padding(.bottom, 10)
		//		Group {
		//			switch viewData.appState {
		//			case .authorized:
		//				NavigationView {
		////					Text("Authorized")
		//					Text(viewData.email)
		//					AppTextField(text: viewData.email,
		//								 textPlaceholder: "Text")
		//						.frame(minWidth: 280, maxWidth: 400, idealHeight: 35, alignment: .leading)
		//						.padding(.horizontal, 40)
		//						.keyboardType(.emailAddress)
		//						.padding(.bottom, 10)
		//				}
		//				.navigationViewStyle(StackNavigationViewStyle())
		//			case .unAuthorized:
		//				NavigationView {
		//					Text("UnAuthorized")
		//				}
		//				.navigationViewStyle(StackNavigationViewStyle())
		//			}
		//		}
	}
}

struct AppTextField: View {
	@Binding var text: String
	var textPlaceholder: String = ""
	var placeHolerFontSize: CGFloat = 16.0
	var needDiver: Bool = true
	
	var body: some View {
		VStack {
			TextField("", text: $text)
				.placeholder(when: text.isEmpty) {
					Text(textPlaceholder)
						.foregroundColor(.textLightColor)
						.font(.customFont(size: placeHolerFontSize, weight: .light))
				}
				.modifier(ClearButton(text: $text))
				.font(Font.customFont(weight: .regular))
				.padding(.bottom, 0)
				.foregroundColor(.textColor)
				.autocapitalization(.none)
			
			if needDiver { Divider() }
		}
	}
}


struct ClearButton: ViewModifier {
	@Binding var text: String
	
	public func body(content: Content) -> some View {
		ZStack(alignment: .trailing) {
			content
			
			if !text.isEmpty {
				Button(action: {
					self.text = ""
				}) {
					Image(systemName: "multiply.circle.fill").foregroundColor(Color(UIColor.opaqueSeparator))
				}
				.padding(.trailing, 8)
				.buttonStyle(PlainButtonStyle())
			}
		}
	}
}
