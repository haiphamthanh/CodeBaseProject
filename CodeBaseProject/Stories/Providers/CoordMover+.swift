//
//  CoordMover+.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 16/04/2022.
//

import Swinject
import RxSwift

struct CoordMover<ResultType> {
	private let current: CoordinatorAdapter<ResultType>
	
	init(_ current: CoordinatorAdapter<ResultType>) {
		self.current = current
	}
}

/**
Move to any screen in stories
- parameter params: INPUT for push view controller, manage by NavigationParameters
*/
extension CoordMover {
	// MARK: Introduction ------------------
	func transitToIntro(params: Dictionary<String, Any>? = nil) -> Observable<ResultType> {
		guard let coordinator = CoordInstance.Atomic.intro(params) as? CoordinatorAdapter<ResultType> else {
			return Observable.never()
		}
		
		return current.coordinate(to: coordinator)
	}
	
	// MARK: Introduction ------------------
	func transitToHome(params: Dictionary<String, Any>? = nil) -> Observable<ResultType> {
		guard let coordinator = CoordInstance.Atomic.home(params: params) as? CoordinatorAdapter<ResultType> else {
			return Observable.never()
		}
		
		return current.coordinate(to: coordinator)
	}
}
