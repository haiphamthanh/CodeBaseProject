//
//  AppRootView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 13/07/2021.
//

import SwiftUI
import RxSwift

// ViewModel ===> View
protocol RootViewModelViewSupport {
	var authState: Observable<AuthState> { get }
	var counting: Observable<Int> { get }
	
	// Actions
	func gotoHome()
}

struct RootView {
	private init() { }
}

// Properties is used for View
extension RootView {
	class IPros: DefaultIPros<RootViewModelViewSupport>, ObservableObject {
		private let disposeBag = DisposeBag()
		@Published private(set) var counting: String = "0"
		@Published private(set) var authState: AuthState = .unAuthorized
		
		override init(viewModel: ViewModelRule) {
			super.init(viewModel: viewModel)
			
			// Adapter
			indViewModel?.authState
				.subscribe { authState in
					print("State \(authState)")
				}
				.disposed(by: disposeBag)
			
			indViewModel?.counting
				.subscribe(onNext: countChanged)
				.disposed(by: disposeBag)
			
		}
		
		private func countChanged(_ number: Int) {
			counting = "\(number)"
		}
		
		// Actions
		func gotoHome() {
			indViewModel?.gotoHome()
		}
	}
}

// MARK: - ================================= View Layout =================================
extension RootView {
	struct IView: View, ViewRule {
		// MARK: Properties
		@ObservedObject var pros: IPros
		
		// MARK: Layout
		var containView: some View {
			VStack {
				Text("Loading... Please wait for a minutes")
				Text(pros.counting)
				Button("Go home") {
					pros.gotoHome()
				}
			}.onDisappear {
				self.pros.invalidate()     // << here !!
			}
		}
		
		var body: some View {
			NavigationViewWrapper(containView: AnyView(containView))
		}
	}
}
