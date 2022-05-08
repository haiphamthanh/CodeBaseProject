//
//  IntroStory.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 15/04/2022.
//

import RxSwift
import SwiftUI

/// Coordinator Out
/// Coordinator Identify
protocol IntroStory {
}

// ViewModel ===> Story
protocol IntroStoryViewModelStorySupport: AnyObject {
}

class IntroStoryImpl: DefaultStory<Void>, IntroStory {
	typealias IndividualViewModel = IntroStoryViewModelStorySupport
	weak var indViewModel: IndividualViewModel?
	
	override init(view: AnyView? = nil, viewModel: ViewModelRule? = nil) {
		super.init(view: view, viewModel: viewModel)
		
		if let indViewModel = viewModel as? IndividualViewModel {
			self.indViewModel = indViewModel
		}
	}
	
	override func customAction(on viewModel: ViewModelRule?,
							   view: AnyView?) -> Observable<Void> {
		return forward(by: viewModel)
	}
}

// MARK: - ########################## FORWARD FLOW
private extension IntroStoryImpl {
	func forward(by viewModel: ViewModelRule?) -> Observable<Void> {
		return toIntro()
			.do(onNext: { })
	}
}

// Bridge
private extension IntroStoryImpl {
	func toIntro() -> Observable<Void> {
		return CoordTransiter(self)
			.move(to: .intro(nil, .`init`))
	}
}
