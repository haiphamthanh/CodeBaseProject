//
//  IntroStory.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 15/04/2022.
//

import Swinject
import RxSwift

class IntroStory: CoordinatorAdapter<Void> {
	// MARK: - ================================= Proxy action =================================
	override func start(viewModel: ViewModelRule) -> Observable<Void> {
		return driverCoordinator()
	}
}

// MARK: - ########################## Intro Story Manager ##########################
private extension IntroStory {
	// Driver
	func driverCoordinator() -> Observable<Void> {
		return introduceApp()
	}
	
	// Tasks
	func introduceApp() -> Observable<Void> {
		return bringMeToIntro()
			.do(onNext: { _ in })
	}
}
