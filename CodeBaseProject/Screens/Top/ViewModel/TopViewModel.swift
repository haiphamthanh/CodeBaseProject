//
//  TopViewModel.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 16/04/2022.
//

import RxSwift

/// ViewModel Out
/// ViewModel Identify
protocol TopViewModel {
}

class TopViewModelImpl: DefaultViewModel<Void>, ViewModelRule, TopViewModel {
	// MARK: Actions
	let _authState = PublishSubject<AuthState>()
	let _showMenu = PublishSubject<Bool>()
	
	// MARK: Moving
	let _home = PublishSubject<Void>()
	let _intro = PublishSubject<Void>()
	let _detail = PublishSubject<TopSearchView.FruitItem>()
	
	// MARK: Subs
	private var tabbarManager: TabBarPropsViewModel!
	
	// MARK: Sample
	private var counter = 0
	let _counting = PublishSubject<Int>()
	
	// MARK: ================================= Init =================================
	required init() {
		super.init()
		
		tabbarManager = TabBarPropsViewModel(viewModel: self)
		firstLoading()
	}
	
	final func firstLoading() {
		
		// MARK: Sample
		return changeState()
	}
}

// MARK: Sample
private extension TopViewModelImpl {
	func changeState() {
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
