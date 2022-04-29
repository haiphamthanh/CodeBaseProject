//
//  CoordInstance+.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 16/04/2022.
//

import Swinject

struct CoordInstance {
	private init() { }
}

private extension CoordInstance {
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
		static func proxy(params: Dictionary<String, Any>? = nil) -> DefaultCoordinator<Void> {
			@Inject var coordinator: ProxyStory
			return defaultCoordinator(coordinator)
		}
		
		static func intro(params: Dictionary<String, Any>? = nil) -> DefaultCoordinator<Void> {
			@Inject var coordinator: IntroStory
			return defaultCoordinator(coordinator)
		}
		
		static func home(params: Dictionary<String, Any>? = nil) -> DefaultCoordinator<Void> {
			@Inject var coordinator: HomeStory
			return defaultCoordinator(coordinator)
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
		
		static func top<ResultType>(_ params: Dictionary<String, Any>? = nil) -> DefaultCoordinator<ResultType> {
			@Inject var coordinator: TopCoordinator
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
