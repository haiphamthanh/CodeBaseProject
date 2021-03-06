//
//  RootViewModel+Supports.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 16/04/2022.
//

import RxSwift

// MARK: - ================================= Coordinator support =================================
extension RootViewModelImpl: RootViewModelCoordSupport {
	var goHome: Observable<Void> {
		return _home
			.asObservable()
	}
}

// MARK: - ================================= View support =================================
extension RootViewModelImpl: RootViewModelViewSupport {
	var authState: Observable<AuthState> {
		_authState.asObservable()
	}
	
	var counting: Observable<Int> {
		_counting.asObservable()
	}
	
	func gotoHome() {
		_home.onNext(Void())
	}
}

