//
//  TopViewModel.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 16/04/2022.
//

import Combine
import RxSwift

/// ViewModel Out
/// ViewModel Identify
protocol TopViewModel {
}

class TopViewModelImpl: DefaultViewModel, ViewModelRule, TopViewModel {
	let _counting = PublishSubject<Int>()
	let _authState = PublishSubject<AuthState>()
	let _home = PublishSubject<Void>()
	
	private var counter = 0
	
	required init() {
		super.init()

		load()
	}

	func load() {
		Task {
			await self.changeStateAfter2Seconds()
		}
	}
	
	@MainActor
	private func changeStateAfter2Seconds() async -> AuthState {
		try? await Task.sleep(nanoseconds: 2_000_000_000)
		counter += 1
		_counting.onNext(counter)
		return await changeStateAfter2Seconds()
	}
}
