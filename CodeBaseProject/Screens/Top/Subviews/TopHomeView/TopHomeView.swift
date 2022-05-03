//
//  TopHomeView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 21/04/2022.
//

import SwiftUI
import RxSwift

// ViewModel ===> View
protocol TopHomeViewModelViewSupport: AnyObject {
	// MARK: Broadcasting object
	var authState: Observable<AuthState> { get }
	
	// MARK: Actions
	func tapAvatar()
	func tapSetting()
}

struct TopHomeView {
	private init() { }
}

// Properties is used for View
extension TopHomeView {
	class IPros: DefaultIPros<TopHomeViewModelViewSupport>, ObservableObject {
		private let disposeBag = DisposeBag()
		@Published private(set) var authState: AuthState = .unAuthorized
		@Published var selectedTabbar: TabbarType = .home
		
		override init(viewModel: ViewModelRule) {
			super.init(viewModel: viewModel)
			
			// View Model Adapter to
			let onNextAuth = strongify(self, closure: { (instance, auth: AuthState) in
				print("State \(auth)")
			})
			indViewModel?.authState
				.subscribe(onNext: onNextAuth)
				.disposed(by: disposeBag)
		}
		
		func avatarButtonHandler() {
			indViewModel?.tapAvatar()
		}
		
		func settingButtonHandler() {
			indViewModel?.tapSetting()
		}
	}
}

// MARK: - ================================= View Layout =================================
extension TopHomeView {
	struct IView: View, ViewRule {
		// MARK: Properties
		@ObservedObject var pros: IPros
		@State private var touchedAvatar: Bool = false
		@State private var touchedSetting: Bool = false
		
		// MARK: Layout
		var body: some View {
			VStack {
				ExNavigationBarView(touchedAvatar: $touchedAvatar.onUpdate(avatarButtonHandler),
									touchedSetting: $touchedSetting.onUpdate(settingButtonHandler))
				
				Spacer()
			}
		}
		
		private func avatarButtonHandler(_ isTouched: Bool) {
			pros.avatarButtonHandler()
		}
		
		private func settingButtonHandler(_ isTouched: Bool) {
			pros.settingButtonHandler()
		}
	}
}


#if DEBUG
struct TopHomeView_Previews: PreviewProvider {
	static var previews: some View {
		let viewModel = TopViewModelImpl()
		let props = TopHomeView.IPros(viewModel: viewModel)
		AnyView(TopHomeView.IView(pros: props))
	}
}
#endif
