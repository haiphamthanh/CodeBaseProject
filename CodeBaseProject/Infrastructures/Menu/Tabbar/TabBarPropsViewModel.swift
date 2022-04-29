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
		// Top Home
		@Inject var topHomeViewModel: TopHomeViewModel
		guard let topViewModelRule = topHomeViewModel as? ViewModelRule else {
			fatalError("View model need to confirm to ViewModelRule")
		}
		let topHomeProps = PropsInstance.topHomeProps(viewModel: topViewModelRule)
		props.append(.topHome(topHomeProps))
		
		
		// Hold in view builder
		if !TabBarViewBuilder
			.builder
			.hold(.topHome(topHomeProps))
			.build() {
			fatalError("Oops!! There're something wrong!!!")
		}
	}
}
