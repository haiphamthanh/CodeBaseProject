//
//  TopCoordinator.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 26/07/2021.
//

import SwiftUI
import RxSwift

/// Coordinator Out
/// Coordinator Identify
protocol TopCoordinator {
}

// ViewModel ===> Coordinator
protocol TopViewModelCoordSupport: AnyObject {
	var goHome: Observable<Void> { get }
}

// Implementation
class TopCoordinatorImpl: DefaultCoordinator<Void>, CoordinatorRule, TopCoordinator {
	typealias IndividualViewModel = TopViewModelCoordSupport
	weak var indViewModel: IndividualViewModel?
	
	override init(view: AnyView? = nil, viewModel: ViewModelRule? = nil) {
		super.init(view: view, viewModel: viewModel)
		
		if let indViewModel = viewModel as? IndividualViewModel {
			self.indViewModel = indViewModel
		}
	}
	
	override func customAction(on viewModel: ViewModelRule?,
							   view: AnyView?) -> Observable<Void> {
		guard let viewModel = viewModel, let indViewModel = viewModel as? IndividualViewModel else {
			fatalError("View model need to support \(IndividualViewModel.self)")
		}
		
		let home = indViewModel.goHome
			.flatMap(toHome)
			.subscribe()
		
		return viewModel.didDone
			.take(1)
			.do(onNext: { _ in
				home.dispose()
			})
	}
}

// Bridge
private extension TopCoordinatorImpl {
	func toHome() -> Observable<Void> {
		CoordTransiter(self)
			.move(to: .home())
	}
}
