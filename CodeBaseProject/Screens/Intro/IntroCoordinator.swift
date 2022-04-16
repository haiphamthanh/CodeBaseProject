//
//  IntroCoordinator.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 08/04/2022.
//

import SwiftUI
import RxSwift

/// Coordinator Out
/// Coordinator Identify
protocol IntroCoordinator {
}

// ViewModel ===> Coordinator
protocol IntroViewModelCoordSupport {
}

// Implementation
class IntroCoordinatorImpl: DefaultCoordinator<Void>, CoordinatorRule, IntroCoordinator {
	typealias IndividualViewModel = IntroViewModelCoordSupport
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
