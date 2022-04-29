//
//  TabBarPropsViewModel.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 28/04/2022.
//

import SwiftUI

class TabBarPropsViewModel {
	private var props = [TopViewPropType]()
	required init() {
		self.allocateResources()
	}
}

/// Usage
extension TabBarPropsViewModel {
	func delegate(_ parent: AnyObject) {
		for prop in props {
			prop.viewModel.delegate(parent)
		}
	}
}

/// Private
private extension TabBarPropsViewModel {
	func allocateResources() {
		// Top Home (SubView)
		@Inject var topHomeViewModel: TopHomeViewModel
		guard let topHomeViewModelRule = topHomeViewModel as? ViewModelRule else {
			fatalError("View model need to confirm to ViewModelRule")
		}
		let topHomeProps = ViewInstance.SubView.PropsInstance.topHomeProps(viewModel: topHomeViewModelRule)
		props.append(.topHome(topHomeProps))
		
		// Top Search (SubView)
		@Inject var topSearchViewModel: TopSearchViewModel
		guard let topSearchViewModelRule = topSearchViewModel as? ViewModelRule else {
			fatalError("View model need to confirm to ViewModelRule")
		}
		let topSearchProps = ViewInstance.SubView.PropsInstance.topSearchProps(viewModel: topSearchViewModelRule)
		props.append(.topSearch(topSearchProps))
		
		// Top Notification (SubView)
		@Inject var topNotiViewModel: TopNotificationViewModel
		guard let topNotiViewModelRule = topNotiViewModel as? ViewModelRule else {
			fatalError("View model need to confirm to ViewModelRule")
		}
		let topNotiProps = ViewInstance.SubView.PropsInstance.topNotiProps(viewModel: topNotiViewModelRule)
		props.append(.topNoti(topNotiProps))
		
		// Top Video (SubView)
		@Inject var topVideoViewModel: TopVideoViewModel
		guard let topVideoViewModelRule = topVideoViewModel as? ViewModelRule else {
			fatalError("View model need to confirm to ViewModelRule")
		}
		let topVideoProps = ViewInstance.SubView.PropsInstance.topVideoProps(viewModel: topVideoViewModelRule)
		props.append(.topVideo(topVideoProps))
		
		
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
