//
//  HomeStory.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 15/04/2022.
//

import RxSwift
import SwiftUI

/// Coordinator Out
/// Coordinator Identify
protocol HomeStory {
}

// ViewModel ===> Story
protocol HomeStoryViewModelStorySupport: AnyObject {
}

class HomeStoryImpl: DefaultStory<Void>, HomeStory {
	typealias IndividualViewModel = HomeStoryViewModelStorySupport
	weak var indViewModel: IndividualViewModel?
	
	override init(view: AnyView? = nil, viewModel: ViewModelRule? = nil) {
		super.init(view: view, viewModel: viewModel)
		
		if let indViewModel = viewModel as? IndividualViewModel {
			self.indViewModel = indViewModel
		}
	}
	
	override func customAction(on viewModel: ViewModelRule?, view: AnyView?) -> Observable<Void> {
		return driver(by: viewModel)
	}
}

// MARK: - ########################## DRIVER
private extension HomeStoryImpl {
	func driver(by viewModel: ViewModelRule?) -> Observable<Void> {
		return toHome()
			.do(onNext: { })
	}
}

// Bridge
private extension HomeStoryImpl {
	func toHome() -> Observable<Void> {
		return CoordTransiter(self)
			.move(to: .home(nil, .`init`))
	}
}
