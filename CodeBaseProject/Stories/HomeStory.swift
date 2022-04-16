//
//  HomeStory.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 15/04/2022.
//

import RxSwift

class HomeStory {
	func start() -> Observable<Void> {
		return driverCoordinator()
	}
}

// MARK: - ########################## Intro Story Manager ##########################
private extension HomeStory {
	// Driver
	func driverCoordinator() -> Observable<Void> {
		return enterHome()
	}
	
	func enterHome() -> Observable<Void> {
		CoordInstance.Atomic.root()
			.startProcess(on: .`init`)
			.do(onNext: { _ in })
	}
}
