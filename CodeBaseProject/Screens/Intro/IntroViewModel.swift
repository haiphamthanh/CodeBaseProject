//
//  IntroViewModel.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 08/04/2022.
//

import Combine

class IntroViewModel: ViewModelRule {
	typealias C = IntroCoordinator
	let coordinator: C
	
	init(coordinator: C) {
		self.coordinator = coordinator
	}
}
