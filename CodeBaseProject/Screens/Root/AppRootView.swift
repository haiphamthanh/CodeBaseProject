//
//  AppRootView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 13/07/2021.
//

import SwiftUI

// MARK: - ================================= View input requirements =================================
//protocol AppRootViewDataPolicy {
////	var authState: AuthState { get }
////	var email: String { get set }
////	var mail: String { get set }
////
////	// Action
////	func gotoHome()
//}
//
////protocol AppRootViewProtocol {
////}

class AppRootPros: ObservableObject {
	var authState: AuthState {
		return viewModel.authState
	}
	
	var email: String {
		get { viewModel.email }
		set { viewModel.email = newValue }
	}
	
	var mail: String {
		get { viewModel.email }
		set { viewModel.email = newValue }
	}
	
	func gotoHome() {
		//
	}
	
	var viewModel: AppRootViewModelProtocol
	
	init(viewModel: AppRootViewModelProtocol) {
		self.viewModel = viewModel
	}
}

class AppRootAction {
	
}

// MARK: - ================================= View Layout =================================
struct AppRootView<Pros>: View, ViewRule where Pros: AppRootPros {
	
	// MARK: Properties
	@ObservedObject var pros: Pros
	typealias Act = AppRootAction
	private(set) var act: Act
	
	// MARK: Init
	init(pros: Pros, act: Act = AppRootAction()) {
		self.pros = pros
		self.act = act
	}
	
	// MARK: Layout
	var body: some View {
		VStack {
			Text(pros.email)
			AppTextField(text: $pros.mail,
						 textPlaceholder: "Text")
			.frame(minWidth: 280, maxWidth: 400, idealHeight: 35, alignment: .leading)
			.padding(.horizontal, 40)
			.keyboardType(.emailAddress)
			.padding(.bottom, 10)
			Button("Go to Home") {
				pros.gotoHome()
			}
			.frame(minWidth: 280, maxWidth: 400, idealHeight: 35, alignment: .leading)
			.background(Color.red)
		}
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

//struct AppRootView_Previews: PreviewProvider {
//	static var previews: some View {
//		AppRootView()
//	}
//}

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
