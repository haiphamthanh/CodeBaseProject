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
		static func intro(_ params: Dictionary<String, Any>? = nil) -> DefaultCoordinator<Void> {
			guard let coordinator = container.sureResolve(IntroCoordinator.self) as? DefaultCoordinator<Void> else {
				fatalError("Coordinator need based on DefaultCoordinator")
			}
			
			return coordinator
		}
		
		static func root(_ params: Dictionary<String, Any>? = nil) -> DefaultCoordinator<Void> {
			guard let coordinator = container.sureResolve(RootCoordinator.self) as? DefaultCoordinator<Void> else {
				fatalError("Coordinator need based on DefaultCoordinator")
			}
			
			return coordinator
		}
		
		static func home(params: Dictionary<String, Any>? = nil) -> DefaultCoordinator<Void> {
			guard let coordinator = container.sureResolve(HomeCoordinator.self) as? DefaultCoordinator<Void> else {
				fatalError("Coordinator need based on DefaultCoordinator")
			}
			
			return coordinator
		}
	}
}
