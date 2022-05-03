//
//  CoordTransiter+.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 16/04/2022.
//

import RxSwift

enum SceneName {
	case top(Dictionary<String, Any>? = nil, PresentType = .push)
	case root(Dictionary<String, Any>? = nil, PresentType = .push)
	case home(Dictionary<String, Any>? = nil, PresentType = .push)
	case intro(Dictionary<String, Any>? = nil, PresentType = .push)
	case itemDetail(TopSearchView.FruitItem, PresentType = .push)
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
		case .top(let params, let presentType):
			return toTop(with: params, on: presentType)
		case .root(let params, let presentType):
			return toRoot(with: params, on: presentType)
		case .home(let params, let presentType):
			return toHome(with: params, on: presentType)
		case .intro(let params, let presentType):
			return toIntro(with: params, on: presentType)
		case .itemDetail(let item, let presentType):
			return toItemDetail(item, on: presentType)
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
		let coordinator = CoordInstance.Atomic.intro(params) as? DefaultCoordinator<ResultType>
		return move(to: coordinator, input: Void(), on: presentType)
	}
	
	// MARK: Top ------------------
	func toTop(with params: Dictionary<String, Any>? = nil,
			   on presentType: PresentType = .push) -> Observable<ResultType> {
		let coordinator = CoordInstance.Atomic.top(params) as? DefaultCoordinator<ResultType>
		return move(to: coordinator, input: Void(), on: presentType)
	}
	
	// MARK: Root ------------------
	func toRoot(with params: Dictionary<String, Any>? = nil,
				on presentType: PresentType = .push) -> Observable<ResultType> {
		let coordinator = CoordInstance.Atomic.root(params) as? DefaultCoordinator<ResultType>
		return move(to: coordinator, input: Void(), on: presentType)
	}
	
	// MARK: Home ------------------
	func toHome(with params: Dictionary<String, Any>? = nil,
				on presentType: PresentType = .push) -> Observable<ResultType> {
		let coordinator = CoordInstance.Atomic.home(params) as? DefaultCoordinator<ResultType>
		return move(to: coordinator, input: Void(), on: presentType)
	}
	
	// MARK: Detail ------------------
	func toItemDetail(_ item: TopSearchView.FruitItem, on presentType: PresentType = .push) -> Observable<ResultType> {
		let coordinator = CoordInstance.Atomic.itemDetail(item) as? DefaultCoordinator<ResultType>
		return move(to: coordinator, input: item, on: presentType)
	}
}

// MARK: ########################## Helper
private extension CoordTransiter {
	func move<ViewModelResult>(to coordinator: DefaultCoordinator<ResultType>?,
							   input: ViewModelResult,
							   on presentType: PresentType = .push) -> Observable<ResultType> {
		guard let current = current, let coordinator = coordinator else {
			return Observable.never()
		}
		
//		if let currentViewModel = current.viewModel {
//			if let destViewModel = coordinator.viewModel {
//				ModelNodeManager.shared.attach(destViewModel.id, to: currentViewModel.id)
//			}
//		} else if let destViewModel = coordinator.viewModel {
//			ModelNodeManager.shared.push(model: ModelNode(id: destViewModel.id))
//		}
		
		return current.coordinate(to: coordinator, input: input, on: presentType)
	}
}
