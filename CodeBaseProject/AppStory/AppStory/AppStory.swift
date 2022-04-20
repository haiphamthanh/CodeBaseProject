//
//  AppStory.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 16/04/2022.
//

import RxSwift
import SwiftUI

/// Coordinator Out
/// Coordinator Identify
protocol AppStory {
	func run() -> Observable<Void>
}

// ViewModel ===> Story
protocol AppStoryViewModelStorySupport: AnyObject {
}

class AppStoryImpl: DefaultStory<Void>, AppStory {
	typealias IndividualViewModel = AppStoryViewModelStorySupport
	var indViewModel: IndividualViewModel?
	
	override init(view: AnyView? = nil, viewModel: ViewModelRule? = nil) {
		super.init(view: view, viewModel: viewModel)
		
		if let indViewModel = viewModel as? IndividualViewModel {
			self.indViewModel = indViewModel
		}
	}
	
	// MARK: - ================================= Proxy action =================================
	override func customAction(on viewModel: ViewModelRule?, view: AnyView?) -> Observable<Void> {
		return proxyApp(by: viewModel)
	}
	
	func run() -> Observable<Void> {
		return startProcess()
	}
}

// MARK: - ########################## DRIVER
private extension AppStoryImpl {
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
