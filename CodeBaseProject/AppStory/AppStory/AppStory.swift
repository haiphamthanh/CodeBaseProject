//
//  AppStory.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 16/04/2022.
//

import RxSwift
import SwiftUI

class AppStory: StoryDefault<Void> {
	// MARK: - ================================= Proxy action =================================
	override func customAction(on viewModel: ViewModelRule?, view: AnyView?) -> Observable<Void> {
		return proxyApp(by: viewModel)
	}
	
	deinit {
		print("\(self) is deinit")
	}
}

// MARK: - ########################## DRIVER
private extension AppStory {
	func proxyApp(by viewModel: ViewModelRule?) -> Observable<Void> {
		let isValidApp = true // Check by model
		if !isValidApp {
			return finishStory()
		}
		
		return forwardStories(by: viewModel)
	}
	
	func forwardStories(by viewModel: ViewModelRule?) -> Observable<Void> {
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
			return forwardToIntroStory(storyCompletion)
		}
		
		return forwardToHomeStory(storyCompletion)
	}
}
