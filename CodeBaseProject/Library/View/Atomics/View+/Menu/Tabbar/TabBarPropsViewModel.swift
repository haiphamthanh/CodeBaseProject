//
//  TabBarPropsViewModel.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 28/04/2022.
//

import SwiftUI

class TabBarPropsViewModel {
	private var props: [TopViewPropType]? = [TopViewPropType]()
	private weak var viewModel: ViewModelRule!
	init(viewModel: ViewModelRule) {
		self.viewModel = viewModel
		self.allocateResources()
	}
}

/// Usage
extension TabBarPropsViewModel {
	func releaseProps() {
		props = nil
	}
}

/// Private
private extension TabBarPropsViewModel {
	func allocateResources() {
		// Top Home (SubView)
		let topHomeProps = ViewInstance.SubView.PropsInstance.topHomeProps(viewModel: viewModel)
		topHomeProps.viewModel?.delegate(viewModel)
		props?.append(.topHome(topHomeProps))
		
		// Top Search (SubView)
		let topSearchProps = ViewInstance.SubView.PropsInstance.topSearchProps(viewModel: viewModel)
		topSearchProps.viewModel?.delegate(viewModel)
		props?.append(.topSearch(topSearchProps))
		
		// Top Notification (SubView)
		let topNotiProps = ViewInstance.SubView.PropsInstance.topNotiProps(viewModel: viewModel)
		topNotiProps.viewModel?.delegate(viewModel)
		props?.append(.topNoti(topNotiProps))
		
		// Top Video (SubView)
		let topVideoProps = ViewInstance.SubView.PropsInstance.topVideoProps(viewModel: viewModel)
		topVideoProps.viewModel?.delegate(viewModel)
		props?.append(.topVideo(topVideoProps))
		
		
		// Hold in view builder
		if !TabBarViewBuilder
			.builder
			.hold(.topHome(topHomeProps))
			.hold(.topSearch(topSearchProps))
			.hold(.topNoti(topNotiProps))
			.hold(.topVideo(topVideoProps))
			.build() {
			fatalError("Oops!! There're something wrong!!!")
		}
	}
}
