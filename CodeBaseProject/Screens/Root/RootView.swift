//
//  AppRootView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 13/07/2021.
//

/*
 import SwiftUI
 
 // MARK: - ================================= View input requirements =================================
 protocol AppRootViewPros: ObservableObject {
 var authState: AuthState { get }
 var email: String { get set }
 var mail: String { get set }
 
 // Action
 func gotoSomeWhere()
 }
 
 class AppRootViewModelAdapter: AppRootViewPros {
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
 
 func gotoSomeWhere() {
 viewModel.gotoSomeWhere()
 }
 
 private var viewModel: AppRootViewModel
 init(viewModel: AppRootViewModel) {
 self.viewModel = viewModel
 }
 }
 
 // MARK: - ================================= View Layout =================================
 //struct AppRootView<Pros>: View, ViewRule where Pros: AppRootPros {
 struct AppRootView<IPros: AppRootViewPros>: View, ViewRule {
 
 // MARK: Properties
 @ObservedObject var pros: IPros
 
 // MARK: Init
 init(pros: IPros) {
 self.pros = pros
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
 pros.gotoSomeWhere()
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
 */




import SwiftUI
import RxSwift

// ViewModel ===> View
protocol RootViewModelViewSupport {
	var authState: Observable<AuthState> { get }
	var counting: Observable<Int> { get }
}

struct RootView {
	private init() { }
	
	// Properties is used for View
	class IPros: ObservableObject {
		typealias IndividualViewModel = RootViewModelViewSupport
		private let disposeBag = DisposeBag()
		@Published private(set) var counting: String = "0"
		@Published private(set) var authState: AuthState = .unAuthorized
		
		init(viewModel: ViewModelRule) {
			guard let indViewModel = viewModel as? IndividualViewModel else {
				fatalError("View model need to support coordinator")
			}
			
			// Adapter
			indViewModel.authState
				.subscribe { authState in
					print("State \(authState)")
				}
				.disposed(by: disposeBag)
			
			indViewModel.counting
				.subscribe(onNext: countChanged)
				.disposed(by: disposeBag)
			
		}
		
		private func countChanged(_ number: Int) {
			counting = "\(number)"
		}
	}
	
	// MARK: - ================================= View Layout =================================
	struct IView: View, ViewRule {
		// MARK: Properties
		@ObservedObject var pros: IPros
		
		// MARK: Layout
		var body: some View {
			VStack {
				Text("Loading... Please wait for a minutes")
				Text(pros.counting)
			}
		}
	}
}
