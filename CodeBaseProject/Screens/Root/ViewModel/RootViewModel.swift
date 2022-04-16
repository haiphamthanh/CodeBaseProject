//
//  RootViewModel.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 16/04/2022.
//

import Combine
import RxSwift

enum AuthState {
	case authorized
	case unAuthorized
}

/// ViewModel Out
/// ViewModel Identify
protocol RootViewModel {
}

class RootViewModelImpl: DefaultViewModel, ViewModelRule, RootViewModel {
//	@Published private(set) var counting: String = "0"
//	@Published private(set) var authState: AuthState = .unAuthorized
	let _counting = PublishSubject<Int>()
	let _authState = PublishSubject<AuthState>()
	
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
	private func changeStateAfter2Seconds() async -> AuthState{
		// Delay of 7.5 seconds (1 second = 1_000_000_000 nanoseconds)
		//		try? await Task.sleep(nanoseconds: 7_500_000_000)
		try? await Task.sleep(nanoseconds: 2_000_000_000)
		counter += 1
		_counting.onNext(counter)
		return await changeStateAfter2Seconds()
	}
}
