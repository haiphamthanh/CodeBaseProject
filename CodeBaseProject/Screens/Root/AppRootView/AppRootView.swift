//
//  AppRootView.swift
//  TBVCommunity
//
//  Created by HaiKaito on 13/07/2021.
//

import SwiftUI

// MARK: - ================================= View input requirements =================================
protocol AppRootRequiredViewData {
	var appState: AppState { get }
	var email: String { get set }
}

extension AppRootViewModel: ViewDataRule, AppRootRequiredViewData {
	typealias T = AppRootRequiredViewData
	var asViewData: T {
		return self
	}
}

class ViewModelWrapper<VM: ViewModelRule> where VM: ViewDataRule {
	@ObservedObject var wrp: VM
	init(wrp: VM) {
		self.wrp = wrp
	}
}

// MARK: - ================================= View Layout =================================
struct AppRootView<VM>: View, ViewRule where VM: ViewModelRule, VM: ViewDataRule {
	// MARK: Alias
	typealias VMD = AppRootViewModel
	typealias I = AppRootRequiredViewData
	
	// MARK: Properties
	@ObservedObject var viewModel: VM
	var viewData: I
	private var vmWrapper: ViewModelWrapper<VMD>
	
	// MARK: Init
	init(viewModel: VM) {
		self.viewModel = viewModel
		
		guard let wrp = viewModel as? VMD else {
			fatalError("Your view model need to be confirm to view data")
		}
		self.vmWrapper = ViewModelWrapper<AppRootViewModel>.init(wrp: wrp)
		
		guard let viewData = viewModel.asViewData as? I else {
			fatalError("Your view model need to be confirm to view data")
		}
		self.viewData = viewData
	}
	
	// MARK: Layout
	var body: some View {
		Text(viewData.email)
		AppTextField(text: vmWrapper.$wrp.email,
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

//protocol AppTextFieldData {
//	@State var text: String { get set }
//}

struct AppTextField: View {
	@Binding var text: String
	var textPlaceholder: String = ""
	var placeHolerFontSize: CGFloat = 16.0
	var needDiver: Bool = true
	
	var body: some View {
//		let text = Binding(
//			get: { value },
//			set: { value = $0 }
//		)
		
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
