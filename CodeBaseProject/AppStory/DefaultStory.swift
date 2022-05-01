//
//  DefaultStory.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 18/04/2022.
//

import RxSwift

class DefaultStory<ResultType>: DefaultCoordinator<ResultType> {
	// TODO: Make it work, it's still not working
	func finishStory() -> Observable<Void> {
		let rootVC = AppProvider.shared.navigationVC
		if let rootNav = rootVC {
			while rootNav.viewControllers.count > 0 {
				rootNav.viewControllers.removeLast()
			}
		}
		
		rootVC?.removeFromParent()
		return Observable.never()
	}
}

extension DefaultStory {
	func forwardToProxyStory(_ completion: @escaping (() -> Void)) -> Observable<Void> {
		let proxyStory = CoordInstance.Story.proxy()
		return coordinate(to: proxyStory, input: Void())
			.do(onNext: completion)
	}
	
	func forwardToIntroStory(_ completion: @escaping (() -> Void)) -> Observable<Void> {
		let introStory = CoordInstance.Story.intro()
		return coordinate(to: introStory, input: Void())
			.do(onNext: completion)
	}
	
	func forwardToHomeStory(_ completion: @escaping (() -> Void)) -> Observable<Void> {
		let homeStory = CoordInstance.Story.home()
		return coordinate(to: homeStory, input: Void())
			.do(onNext: completion)
	}
}
