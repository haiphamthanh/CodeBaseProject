//
//  HomeCoordinator.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 25/03/2022.
//

import Foundation

class HomeCoordinator: CoordinatorRule {
	typealias N = NavigationProvider
	let navigator: N
	init(navigator: NavigationProvider) {
		self.navigator = navigator
	}
}

