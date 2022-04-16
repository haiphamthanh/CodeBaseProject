//
//  HomeCoordinator.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 25/03/2022.
//

import SwiftUI
import RxSwift

/// Coordinator Out
/// Coordinator Identify
protocol HomeCoordinator {
}

// ViewModel ===> Coordinator
protocol HomeViewModelCoordSupport {
}

// Implementation
class HomeCoordinatorImpl: DefaultCoordinator<Void>, CoordinatorRule, HomeCoordinator {
	typealias IndividualViewModel = HomeViewModelCoordSupport
	let indViewModel: IndividualViewModel
	
	init(view: AnyView, viewModel: IndividualViewModel, navigator: NavigationProvider) {
		guard let validViewModel = viewModel as? ViewModelRule else {
			fatalError("Invalid view model")
		}
		
		self.indViewModel = viewModel
		super.init(view: view, viewModel: validViewModel, navigator: navigator)
	}
	
	override func start(viewModel: ViewModelRule) -> Observable<Void> {
		return viewModel.didDone
			.take(1)
			.do(onNext: { _ in })
	}
}
