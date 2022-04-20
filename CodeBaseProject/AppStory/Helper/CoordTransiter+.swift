//
//  CoordTransiter+.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 16/04/2022.
//

import RxSwift

enum SceneName {
	case root(Dictionary<String, Any>? = nil, PresentType = .push)
	case home(Dictionary<String, Any>? = nil, PresentType = .push)
	case intro(Dictionary<String, Any>? = nil, PresentType = .push)
}

struct CoordTransiter<ResultType> {
	private weak var current: DefaultCoordinator<ResultType>?
	
	init(_ current: DefaultCoordinator<ResultType>?) {
		self.current = current
	}
}

// MARK: - ########################## Usage
extension CoordTransiter {
	func move(to scene: SceneName) -> Observable<ResultType> {
		switch scene {
		case .root(let params, let presentType):
			return toRoot(with: params, on: presentType)
		case .home(let params, let presentType):
			return toHome(with: params, on: presentType)
		case .intro(let params, let presentType):
			return toIntro(with: params, on: presentType)
		}
	}
}

/**
 Move to any screen in stories
 - parameter params: INPUT for push view controller, manage by NavigationParameters
 */
private extension CoordTransiter {
	// MARK: Introduction ------------------
	func toIntro(with params: Dictionary<String, Any>? = nil,
				 on presentType: PresentType = .push) -> Observable<ResultType> {
		guard let current = current,
			  let coordinator = CoordInstance.Atomic.intro(params) as? DefaultCoordinator<ResultType> else {
			return Observable.never()
		}
		
		return current.coordinate(to: coordinator, on: presentType)
	}
	
	// MARK: Root ------------------
	func toRoot(with params: Dictionary<String, Any>? = nil,
				on presentType: PresentType = .push) -> Observable<ResultType> {
		let coordinator = CoordInstance.Atomic.root(params) as? DefaultCoordinator<ResultType>
		return move(to: coordinator, on: presentType)
	}
	
	// MARK: Home ------------------
	func toHome(with params: Dictionary<String, Any>? = nil,
				on presentType: PresentType = .push) -> Observable<ResultType> {
		let coordinator = CoordInstance.Atomic.home(params) as? DefaultCoordinator<ResultType>
		return move(to: coordinator, on: presentType)
	}
}

// MARK: ########################## Helper
private extension CoordTransiter {
	func move(to coordinator: DefaultCoordinator<ResultType>?,
			  on presentType: PresentType = .push) -> Observable<ResultType> {
		guard let current = current, let coordinator = coordinator else {
			return Observable.never()
		}
		
		return current.coordinate(to: coordinator, on: presentType)
	}
}
