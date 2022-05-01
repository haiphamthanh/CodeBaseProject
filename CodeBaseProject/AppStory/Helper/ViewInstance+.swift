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
		let pros =  IntroView.IPros(viewModel: viewModel)
		return AnyView(IntroView.IView(pros: pros))
	}
	
	static func topView(viewModel: ViewModelRule) -> AnyView {
		let pros = TopView.IPros(viewModel: viewModel)
		return AnyView(TopView.IView(pros: pros))
	}
	
	static func rootView(viewModel: ViewModelRule) -> AnyView {
		let pros = RootView.IPros(viewModel: viewModel)
		return AnyView(RootView.IView(pros: pros))
	}
	
	static func homeView(viewModel: ViewModelRule) -> AnyView {
		let pros = HomeView.IPros(viewModel: viewModel)
		return AnyView(HomeView.IView(pros: pros))
	}
	
	static func itemDetailView(viewModel: ViewModelRule) -> AnyView {
		let pros = ItemDetailView.IPros(viewModel: viewModel)
		return AnyView(ItemDetailView.IView(pros: pros))
	}
}

// MARK: - ########################## Atomics - SubView ##########################
extension ViewInstance {
	struct SubView {
		private init() { }
		struct PropsInstance {
			private init() { }
		}
		
		static func topHomeView(pros: TopHomeView.IPros) -> AnyView {
			return AnyView(TopHomeView.IView(pros: pros))
		}
		
		static func topSearchView(pros: TopSearchView.IPros) -> AnyView {
			return AnyView(TopSearchView.IView(pros: pros))
		}
		
		
		static func topNotiView(pros: TopNotificationView.IPros) -> AnyView {
			return AnyView(TopNotificationView.IView(pros: pros))
		}
		
		static func topVideoView(pros: TopVideoView.IPros) -> AnyView {
			return AnyView(TopVideoView.IView(pros: pros))
		}
	}
}

// MARK: ViewInstance.SubView.PropsInstance
extension ViewInstance.SubView.PropsInstance {
	static func topHomeProps(viewModel: ViewModelRule) -> TopHomeView.IPros {
		return TopHomeView.IPros(viewModel: viewModel)
	}
	
	static func topSearchProps(viewModel: ViewModelRule) -> TopSearchView.IPros {
		return TopSearchView.IPros(viewModel: viewModel)
	}
	
	static func topNotiProps(viewModel: ViewModelRule) -> TopNotificationView.IPros {
		return TopNotificationView.IPros(viewModel: viewModel)
	}
	
	static func topVideoProps(viewModel: ViewModelRule) -> TopVideoView.IPros {
		return TopVideoView.IPros(viewModel: viewModel)
	}
}
