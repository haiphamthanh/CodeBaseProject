//
//  ViewInstance+.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 16/04/2022.
//

import SwiftUI

struct ViewInstance {
	private init() { }
}

// MARK: - ########################## Atomics - Scene ##########################
extension ViewInstance {
	static func introView(viewModel: ViewModelRule) -> AnyView {
		let props =  IntroView.IProps(viewModel: viewModel)
		return AnyView(IntroView.IView(props: props))
	}
	
	static func topView(viewModel: ViewModelRule) -> AnyView {
		let props = TopView.IProps(viewModel: viewModel)
		return AnyView(TopView.IView(props: props))
	}
	
	static func rootView(viewModel: ViewModelRule) -> AnyView {
		let props = RootView.IProps(viewModel: viewModel)
		return AnyView(RootView.IView(props: props))
	}
	
	static func homeView(viewModel: ViewModelRule) -> AnyView {
		let props = HomeView.IProps(viewModel: viewModel)
		return AnyView(HomeView.IView(props: props))
	}
	
	static func itemDetailView(viewModel: ViewModelRule) -> AnyView {
		let props = ItemDetailView.IProps(viewModel: viewModel)
		return AnyView(ItemDetailView.IView(props: props))
	}
}

// MARK: - ########################## Atomics - SubView ##########################
extension ViewInstance {
	struct SubView {
		private init() { }
		struct PropsInstance {
			private init() { }
		}
		
		static func topHomeView(props: TopHomeView.IProps) -> AnyView {
			return AnyView(TopHomeView.IView(props: props))
		}
		
		static func topSearchView(props: TopSearchView.IProps) -> AnyView {
			return AnyView(TopSearchView.IView(props: props))
		}
		
		
		static func topNotiView(props: TopNotificationView.IProps) -> AnyView {
			return AnyView(TopNotificationView.IView(props: props))
		}
		
		static func topVideoView(props: TopVideoView.IProps) -> AnyView {
			return AnyView(TopVideoView.IView(props: props))
		}
	}
}

// MARK: ViewInstance.SubView.PropsInstance
extension ViewInstance.SubView.PropsInstance {
	static func topHomeProps(viewModel: ViewModelRule) -> TopHomeView.IProps {
		return TopHomeView.IProps(viewModel: viewModel)
	}
	
	static func topSearchProps(viewModel: ViewModelRule) -> TopSearchView.IProps {
		return TopSearchView.IProps(viewModel: viewModel)
	}
	
	static func topNotiProps(viewModel: ViewModelRule) -> TopNotificationView.IProps {
		return TopNotificationView.IProps(viewModel: viewModel)
	}
	
	static func topVideoProps(viewModel: ViewModelRule) -> TopVideoView.IProps {
		return TopVideoView.IProps(viewModel: viewModel)
	}
}
