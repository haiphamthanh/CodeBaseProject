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
	// MARK: Moving (Pusher)
	func gotoFacebook()
	func gotoPrivacy()
	func gotoHelp()
	func gotoSetting()
}

struct TopView {
	private init() { }
}

// Properties is used for View
extension TopView {
	class IProps: DefaultIProps<TopViewModelViewSupport>, ObservableObject {
		@Published var selectedTabbar: TabbarType = .home
		
		// Actions
		func action(for menu: MenuType) {
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


class AdsViewModel: ObservableObject {
	static let shared = AdsViewModel()
	@Published var interstitial = AdsManager.Interstitial()
	@Published var showInterstitial = false {
		didSet {
			if showInterstitial {
				interstitial.showAd()
				showInterstitial = false
			} else {
				interstitial.requestInterstitialAds()
			}
		}
	}
}

// MARK: - ================================= View Layout =================================
extension TopView {
	struct IView: View, ViewRule {
		// MARK: Properties
		@ObservedObject var props: IProps
		@State private var menuOutput: MenuType = .none
		let adsVM = AdsViewModel.shared
		
		var body: some View {
			NavigationViewWrapper(containView: AnyView(containView))
				.environmentObject(adsVM)
		}
		
		// MARK: Layout
		var containView: some View {
			MainContainerView_A(menuOutput: $menuOutput.onUpdate(menuHandler),
								currentTab: $props.selectedTabbar)
			.onDisappear {
				self.props.invalidate()     // << here !!
			}
		}
		
		private func menuHandler(_ menu: MenuType) {
			props.action(for: menu)
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
