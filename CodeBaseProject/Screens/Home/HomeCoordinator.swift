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
protocol HomeViewModelCoordSupport: AnyObject {
	var goDetail: Observable<TopSearchView.FruitItem> { get }
}

// Implementation
class HomeCoordinatorImpl: DefaultCoordinator<Void>, CoordinatorRule, HomeCoordinator {
	typealias IndividualViewModel = HomeViewModelCoordSupport
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
		
		let detail = indViewModel.goDetail
			.flatMap(toItemDetail)
			.subscribe()
		
		return viewModel.didDone
			.take(1)
			.do(onNext: { _ in
				detail.dispose()
			})
	}
}


// Bridge
private extension HomeCoordinatorImpl {
	func toItemDetail(_ item: TopSearchView.FruitItem) -> Observable<Void> {
		CoordTransiter(self)
			.move(to: .itemDetail(item))
	}
}
