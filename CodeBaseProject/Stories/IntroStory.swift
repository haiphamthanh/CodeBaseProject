//
//  IntroStory.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 15/04/2022.
//

import RxSwift

class IntroStory {
	func start() -> Observable<Void> {
		return introduceApp()
	}
	
	deinit {
		print("\(self) is deinit")
	}
}

// MARK: - ########################## Intro Story Manager ##########################
private extension IntroStory {
	func introduceApp() -> Observable<Void> {
		return CoordInstance.Atomic.intro()
			.startProcess(on: .`init`)
			.do(onNext: { _ in })
	}
}
