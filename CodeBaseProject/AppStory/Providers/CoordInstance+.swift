//
//  CoordInstance+.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 16/04/2022.
//

import Swinject

struct CoordInstance {
//	private static var container: Container {
//		return AppProvider.shared.container
//	}
//	
	private init() { }
}

private extension CoordInstance.Atomic {
	private static func defaultCoordinator<ResultType>(_ coordinator: Any) -> DefaultCoordinator<ResultType> {
		guard let coordinator = coordinator as? DefaultCoordinator<ResultType> else {
			fatalError("Coordinator need based on DefaultCoordinator")
		}
		
		return coordinator
	}
}

// MARK: - ########################## Stories ##########################
extension CoordInstance {
	class Story {
		static func intro(params: Dictionary<String, Any>? = nil) -> IntroStory {
			return IntroStory()
		}
		
		static func home(params: Dictionary<String, Any>? = nil) -> HomeStory {
			return HomeStory()
		}
	}
}

// MARK: - ########################## Atomics ##########################
extension CoordInstance {
	class Atomic {
		static func intro<ResultType>(_ params: Dictionary<String, Any>? = nil) -> DefaultCoordinator<ResultType> {
			@Inject var coordinator: IntroCoordinator
			return defaultCoordinator(coordinator)
		}
		
		static func root<ResultType>(_ params: Dictionary<String, Any>? = nil) -> DefaultCoordinator<ResultType> {
			@Inject var coordinator: RootCoordinator
			return defaultCoordinator(coordinator)
		}
		
		static func home<ResultType>(_ params: Dictionary<String, Any>? = nil) -> DefaultCoordinator<ResultType> {
			@Inject var coordinator: HomeCoordinator
			return defaultCoordinator(coordinator)
		}
	}
}
