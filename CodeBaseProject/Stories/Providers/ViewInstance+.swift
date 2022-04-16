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
	
	static func homeView(viewModel: ViewModelRule) -> AnyView {
		let pros = HomeView.IPros(viewModel: viewModel)
		return AnyView(HomeView.IView(pros: pros))
	}
}
