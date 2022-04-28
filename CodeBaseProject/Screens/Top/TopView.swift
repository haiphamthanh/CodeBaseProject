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
	var showMenu: Observable<Bool> { get }
	
	// Actions
	func gotoFacebook()
	func gotoPrivacy()
	func gotoHelp()
}

struct TopView {
	private init() { }
}

// Properties is used for View
extension TopView {
	class IPros: DefaultIPros<TopViewModelViewSupport>, ObservableObject {
		private let disposeBag = DisposeBag()
		@Published private(set) var counting: String = "0"
		@Published private(set) var authState: AuthState = .unAuthorized
		@Published var showMenu: Bool = false
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
			
			let onNextCounting = strongify(self, closure: { (instance, number: Int) in
				instance.counting = "\(number)"
			})
			indViewModel?.counting
				.subscribe(onNext: onNextCounting)
				.disposed(by: disposeBag)
			
			let onNextShowMenu = strongify(self, closure: { (instance, showMenu: Bool) in
				instance.showMenu = showMenu
			})
			indViewModel?.showMenu
				.subscribe(onNext: onNextShowMenu)
				.disposed(by: disposeBag)
		}
		
		// Actions
		func action(for menu: MenuType) {
			showMenu = false
			
			preventInvalidateModel {
				switch menu {
				case .home:
					selectedTabbar = .home
				case .search:
					selectedTabbar = .search
				case .noti:
					selectedTabbar = .noti
				case .video:
					selectedTabbar = .video
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
	}
}

// MARK: - ================================= View Layout =================================
extension TopView {
	struct IView: View, ViewRule {
		// MARK: Properties
		@ObservedObject var pros: IPros
		//		@State private var showMenu: Bool = false
		@State private var menuOutput: MenuType = .none
		@State private var currentTab: TabbarType = .home
		
		var body: some View {
			NavigationViewWrapper(containView: AnyView(containView))
		}
		
		// MARK: Layout
		var containView: some View {
			SlideOutMenu(showMenu: $pros.showMenu,
						 menuOutput: $menuOutput.onUpdate(menuHandler),
						 currentTab: $pros.selectedTabbar)
				.onDisappear {
					self.pros.invalidate()     // << here !!
				}
		}
		
		private func menuHandler(_ menu: MenuType) {
			pros.action(for: menu)
		}
	}
}



/*
 import RxRelay
 
 /// https://kean.blog/post/rxui
 @propertyWrapper
 public struct RxPublished<Value>: RxPublishedProtocol {
 private let relay: BehaviorRelay<Value>
 var publishedWillChange: Observable<Void> { relay.map { _ in () } }
 
 public init(wrappedValue: Value) {
 relay = .init(value: wrappedValue)
 }
 
 public var wrappedValue: Value {
 set { relay.accept(newValue) }
 get { relay.value }
 }
 
 public var projectedValue: BehaviorRelay<Value> { relay }
 }
 
 protocol RxPublishedProtocol {
 var publishedWillChange: Observable<Void> { get }
 }
 */
