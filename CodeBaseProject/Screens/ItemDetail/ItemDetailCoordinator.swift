//
//  ItemDetailCoordinator.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 08/04/2022.
//

import SwiftUI
import RxSwift

/// Coordinator Out
/// Coordinator Identify
protocol ItemDetailCoordinator {
}

// ViewModel ===> Coordinator
protocol ItemDetailViewModelCoordSupport: AnyObject {
}

// Implementation
class ItemDetailCoordinatorImpl: DefaultCoordinator<Void>, CoordinatorRule, ItemDetailCoordinator {
	typealias IndividualViewModel = IntroViewModelCoordSupport
	weak var indViewModel: IndividualViewModel?
	
	override init(view: AnyView? = nil, viewModel: ViewModelRule? = nil) {
		super.init(view: view, viewModel: viewModel)
		
		if let indViewModel = viewModel as? IndividualViewModel {
			self.indViewModel = indViewModel
		}
	}
	
	override func customAction(on viewModel: ViewModelRule?,
							   view: AnyView?) -> Observable<Void> {
		guard let viewModel = viewModel else {
			fatalError("View model need to available")
		}

		return viewModel.didDone
			.take(1)
			.do(onNext: { _ in })
	}
}
