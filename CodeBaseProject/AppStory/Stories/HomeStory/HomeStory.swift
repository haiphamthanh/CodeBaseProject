//
//  HomeStory.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 15/04/2022.
//

import RxSwift
import SwiftUI

class HomeStory: StoryDefault<Void> {
	override func customAction(on viewModel: ViewModelRule?, view: AnyView?) -> Observable<Void> {
		return driver(by: viewModel)
	}
	
	deinit {
		print("\(self) is deinit")
	}
}

// MARK: - ########################## DRIVER
private extension HomeStory {
	func driver(by viewModel: ViewModelRule?) -> Observable<Void> {
		return toHome()
			.do(onNext: { })
	}
}

// Bridge
private extension HomeStory {
	func toHome() -> Observable<Void> {
		return CoordTransiter(self)
			.toRoot(on: .`init`)
	}
}
