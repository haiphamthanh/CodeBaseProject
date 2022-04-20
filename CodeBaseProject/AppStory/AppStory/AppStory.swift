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
	var isAppValid: Observable<Bool> { get }
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
		return validateStory(by: viewModel)
	}
	
	func run() -> Observable<Void> {
		return startProcess()
	}
}

// MARK: - ########################## DRIVER
private extension AppStoryImpl {
	func validateStory(by viewModel: ViewModelRule?) -> Observable<Void> {
		_ = indViewModel?.isAppValid
			.filter({ !$0 })
			.map({ _ in })
			.flatMap(toInvalidAppScreen)
			.subscribe()
		
		return forwardStory(by: viewModel)
	}
	
	func forwardStory(by viewModel: ViewModelRule?) -> Observable<Void> {
		let storyCompletion = {
			// Do something after all
		}
		
		// Goto intro for fist time install application
		let isFirstInstall = !UserDefaults.standard.bool(forKey: "INSTALLED_BEFORE")
		if isFirstInstall {
			UserDefaults.standard.set(true, forKey: "INSTALLED_BEFORE")
			return forwardToIntroStory(storyCompletion)
		}
		
		return forwardToProxyStory(storyCompletion)
	}
}

// Proxy
private extension AppStoryImpl {
	func toInvalidAppScreen() -> Observable<Void> {
		// TODO: Move to proxy scene
		CoordTransiter(self).toIntro(on: .`init`)
	}
}

