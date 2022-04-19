//
//  IntroStory.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 15/04/2022.
//

import RxSwift
import SwiftUI

class IntroStory: StoryDefault<Void> {
	override func customAction(on viewModel: ViewModelRule?,
							   view: AnyView?) -> Observable<Void> {
		return forward(by: viewModel)
	}
	
	deinit {
		print("\(self) is deinit")
	}
}

// MARK: - ########################## FORWARD FLOW
private extension IntroStory {
	func forward(by viewModel: ViewModelRule?) -> Observable<Void> {
		return toIntro()
			.do(onNext: { })
	}
}

// Bridge
private extension IntroStory {
	func toIntro() -> Observable<Void> {
		return CoordTransiter(self)
			.toIntro(on: .`init`)
	}
}
