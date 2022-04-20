//
//  ProxyStory.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 15/04/2022.
//

import RxSwift
import SwiftUI

/// Coordinator Out
/// Coordinator Identify
protocol ProxyStory {
}

// ViewModel ===> Story
protocol ProxyStoryViewModelStorySupport: AnyObject {
}

class ProxyStoryImpl: DefaultStory<Void>, ProxyStory {
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
private extension ProxyStoryImpl {
	func driver(by viewModel: ViewModelRule?) -> Observable<Void> {
		return toRoot()
			.do(onNext: { })
	}
}

// Bridge
private extension ProxyStoryImpl {
	func toRoot() -> Observable<Void> {
		return CoordTransiter(self)
			.toRoot(on: .`init`)
	}
}
