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

// MARK: - ########################## Atomics ##########################
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
}

// MARK: - ########################## Atomics ##########################
extension ViewInstance {
	class SubView {
		static func topHomeView(pros: TopHomeView.IPros) -> AnyView {
			return AnyView(TopHomeView.IView(pros: pros))
		}
	}
}


struct PropsInstance {
	private init() { }
}

// MARK: - ########################## Atomics ##########################
extension PropsInstance {
	static func topHomeProps(viewModel: ViewModelRule) -> TopHomeView.IPros {
		return TopHomeView.IPros(viewModel: viewModel)
	}
}
