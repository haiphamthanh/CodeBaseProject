//
//  HomeStory.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 15/04/2022.
//

import Swinject
import RxSwift

// MARK: - ########################## STORY ##########################
class HomeStory: CoordinatorAdapter<Void> {
	// MARK: - ================================= Proxy action =================================
	override func start(viewModel: ViewModelRule) -> Observable<Void> {
		return driverCoordinator()
	}
}

// MARK: - ########################## Home Story Manager ##########################
private extension HomeStory {
	// Driver
	func driverCoordinator() -> Observable<Void> {
		return introduceApp()
	}
	
	// Tasks
	func introduceApp() -> Observable<Void> {
		return CoordMover(self)
			.transitToIntro()
			.do(onNext: { _ in })
	}
}

