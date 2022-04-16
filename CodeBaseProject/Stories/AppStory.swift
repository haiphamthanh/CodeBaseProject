//
//  AppStory.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 16/04/2022.
//

import Swinject
import RxSwift

class AppStory {
	// MARK: - ================================= Proxy action =================================
	func start() -> Observable<Void> {
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
//		let storyCompletion = { [weak self] (_: Void) in
//			guard let strongSelf = self else { return }
//			strongSelf.driverCoordinator()
//				.subscribe()
//				.disposed(by: strongSelf.disposeBag)
//		}
		let storyCompletion = {
			// Do something after all
		}
		
		// Goto intro for fist time install application
		let isFirstInstall = !UserDefaults.standard.bool(forKey: "INSTALLED_BEFORE")
		if isFirstInstall {
			UserDefaults.standard.set(true, forKey: "INSTALLED_BEFORE")
			return startIntroStory(storyCompletion)
		}
		
		return startHomeStory(storyCompletion)
	}
	
	// Stories
	func startIntroStory(_ storyCompletion: @escaping (() -> Void)) -> Observable<Void> {
		return CoordInstance.Story.intro().start()
	}
	
	// Home
	func startHomeStory(_ storyCompletion: @escaping (() -> Void)) -> Observable<Void> {
		return CoordInstance.Story.home().start()
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
