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
	
	override init(view: AnyView, viewModel: ViewModelRule) {
		guard let indViewModel = viewModel as? IndividualViewModel else {
			fatalError("View model need to support coordinator")
		}

		self.indViewModel = indViewModel
		super.init(view: view, viewModel: viewModel)
	}
	
	override func doActionAfterMove(on viewModel: ViewModelRule) -> Observable<Void> {
		return viewModel.didDone
			.take(1)
			.do(onNext: { _ in })
	}
}
