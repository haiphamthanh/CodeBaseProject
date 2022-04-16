//
//  AppStory.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 16/04/2022.
//

import Swinject
import RxSwift

class AppStory: CoordinatorAdapter<Void> {
	// MARK: - ================================= Proxy action =================================
	override func start(viewModel: ViewModelRule) -> Observable<Void> {
		return proxyCoordinator()
	}
}

private extension AppStory {
	func proxyCoordinator() -> Observable<Void> {
		let isValidApp = isValidApplication()
		if !isValidApp {
			return doneStory(params: nil)
		}
		
		return driverCoordinator()
	}
	
	// Driver
	func driverCoordinator() -> Observable<Void> {
		let storyCompletion = { [weak self] (_: Void) in
			guard let strongSelf = self else { return }
			strongSelf.driverCoordinator()
				.subscribe()
				.disposed(by: strongSelf.disposeBag)
		}
		
		// Goto intro for fist time install application
		let isFirstInstall = !UserDefaults.standard.bool(forKey: "INSTALLED_BEFORE")
		if isFirstInstall {
			UserDefaults.standard.set(true, forKey: "INSTALLED_BEFORE")
			return introStory(storyCompletion)
		}
		
		return oauthStory(storyCompletion)
	}
	
	// Stories
	func introStory(_ storyCompletion: @escaping (() -> Void)) -> Observable<Void> {
		return startIntroStory()
			.do(onNext: storyCompletion)
	}
	
	func oauthStory(_ storyCompletion: @escaping (() -> Void)) -> Observable<Void> {
		return startOauthStory()
			.do(onNext: storyCompletion)
	}
	
	// TODO: Check app for secure
	func isValidApplication() -> Bool {
		return true
	}
	
	func doneStory(params: Dictionary<String, Any>?) -> Observable<Void> {
		return didFinishStory(params: params)
	}
	
	// Finish story
	func didFinishStory(params: Dictionary<String, Any>? = nil) -> Observable<Void> {
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
