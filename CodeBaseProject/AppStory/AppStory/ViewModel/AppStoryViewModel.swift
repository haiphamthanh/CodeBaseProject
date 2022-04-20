//
//  AppStoryViewModel.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 18/04/2022.
//

import RxSwift

/// ViewModel Out
/// ViewModel Identify
protocol AppStoryViewModel {
}

class AppStoryViewModelImpl: DefaultViewModel, ViewModelRule, AppStoryViewModel {
	let _isAppValid = PublishSubject<Bool>()
	
	required init() {
		super.init()

//		load()
	}

	func load() {
		Task {
			let value = await self.invalidApplicationAfter2Seconds()
			_isAppValid.onNext(value)
		}
	}
	
	@MainActor
	private func invalidApplicationAfter2Seconds() async -> Bool {
		try? await Task.sleep(nanoseconds: 5_000_000_000)
		return false
	}
}
