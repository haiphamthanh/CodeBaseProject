//
//  TopView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 13/07/2021.
//

import SwiftUI
import RxSwift

// ViewModel ===> View
protocol TopViewModelViewSupport {
	var authState: Observable<AuthState> { get }
	var counting: Observable<Int> { get }
	
	// Actions
	func gotoHome()
	func gotoSearch()
	func gotoNotifiction()
	func gotoVideo()
	func gotoFacebook()
	func gotoPrivacy()
	func gotoHelp()
	func gotoSetting()
}

struct TopView {
	private init() { }
	
	// Properties is used for View
	class IPros: DefaultIPros<TopViewModelViewSupport>, ObservableObject {
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
		func action(for menu: MenuType) {
			preventInvalidateModel {
				switch menu {
				case .home:
					indViewModel?.gotoHome()
				case .search:
					indViewModel?.gotoSearch()
				case .noti:
					indViewModel?.gotoVideo()
				case .video:
					indViewModel?.gotoVideo()
				case .facebook:
					indViewModel?.gotoFacebook()
				case .privacy:
					indViewModel?.gotoPrivacy()
				case .help:
					indViewModel?.gotoHelp()
				case .none:
					return
				}
			}
		}
		
		func actionOther(for other: OtherType) {
			switch other {
			case .setting:
				indViewModel?.gotoSetting()
			case .none:
				return
			}
		}
	}
	
	// MARK: - ================================= View Layout =================================
	struct IView: View, ViewRule {
		// MARK: Properties
		@ObservedObject var pros: IPros
		@State private var menuOutput: MenuType = .none
		@State private var actionOther: OtherType = .none
		
		var body: some View {
			NavigationViewWrapper(containView: AnyView(containView))
		}
		
		// MARK: Layout
		var containView: some View {
			SlideOutMenu(menuOutput: $menuOutput.onUpdate(menuHandler),
						 actionOther: $actionOther.onUpdate(actionOtherHandler))
			.onDisappear {
				self.pros.invalidate()     // << here !!
			}
			//				.onReceive(Just(menuOutput)) { selection in
			//					print(selection)
			//				}
			//				.onChange(of: menuOutput) { menu in
			//					pros.goto(menu)
			//				}
		}
		
		private func menuHandler(_ menu: MenuType) {
			pros.action(for: menu)
		}
		
		private func actionOtherHandler(_ other: OtherType) {
			pros.actionOther(for: other)
		}
	}
}
