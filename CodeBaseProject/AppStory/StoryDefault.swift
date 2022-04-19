//
//  StoryDefault.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 18/04/2022.
//

import RxSwift

class StoryDefault<ResultType>: DefaultCoordinator<ResultType> {
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

extension StoryDefault {
	func forwardToIntroStory(_ completion: @escaping (() -> Void)) -> Observable<Void> {
		let introStory = CoordInstance.Story.intro()
		return coordinate(to: introStory)
			.do(onNext: completion)
	}
	
	func forwardToHomeStory(_ completion: @escaping (() -> Void)) -> Observable<Void> {
		let homeStory = CoordInstance.Story.home()
		return coordinate(to: homeStory)
			.do(onNext: completion)
	}
}
