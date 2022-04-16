//
//  CoordInstance+.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 16/04/2022.
//

import Swinject
import RxSwift

struct CoordInstance {
	private static var container: Container {
		return AppProvider.shared.container
	}
	
	private init() { }
}

// MARK: - ########################## Stories ##########################
extension CoordInstance {
	class Story {
		static func introStory(params: Dictionary<String, Any>? = nil) -> IntroStory {
			return IntroStory()
		}
	}
}

// MARK: - ########################## Atomics ##########################
extension CoordInstance {
	class Atomic {
		static func intro(_ params: Dictionary<String, Any>? = nil) -> IntroCoordinator {
			let coordinator = container.sureResolve(IntroCoordinator.self)
			//		coordinator.push(params: params)
			return coordinator
		}
		
		static func home(params: Dictionary<String, Any>? = nil) -> HomeCoordinator {
			let coordinator = container.sureResolve(HomeCoordinator.self)
			return coordinator
		}
	}
}


// MARK: - ########################## PROVIDERS ##########################
//// MARK: Manager ------------------
//extension HomeStory {
//	static func introStory(params: Dictionary<String, Any>? = nil) -> IntroStory {
//		return IntroStory()
//	}
//}

extension CoordinatorAdapter {
	func bringMeToHome(params: Dictionary<String, Any>? = nil) -> Observable<Void> {
		guard let coordinator = HomeStory.homeCoordinator(params: params) as? CoordinatorAdapter<Void> else {
			return Observable.never()
		}
		
		return coordinate(to: coordinator)
	}
}
