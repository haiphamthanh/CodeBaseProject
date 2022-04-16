//
//  RootViewModel+Supports.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 16/04/2022.
//

import RxSwift
import Combine

// MARK: - ================================= Coordinator support =================================
extension RootViewModelImpl: RootViewModelCoordSupport {
}

// MARK: - ================================= View support =================================
extension RootViewModelImpl: RootViewModelViewSupport {
	var authState: Observable<AuthState> {
		_authState.asObservable()
	}
	
	var counting: Observable<Int> {
		_counting.asObservable()
	}
	
}

