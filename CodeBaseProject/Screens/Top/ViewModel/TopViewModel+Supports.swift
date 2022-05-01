//
//  TopViewModel+Supports.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 16/04/2022.
//

import RxSwift

// MARK: - ================================= Coordinator support =================================
extension TopViewModelImpl: TopViewModelCoordSupport {
	var goDetail: Observable<TopSearchView.FruitItem> {
		return _detail
			.asObservable()
	}
	
	var goHome: Observable<Void> {
		return _home
			.asObservable()
	}
}

// MARK: - ================================= View support =================================
extension TopViewModelImpl: TopViewModelViewSupport {
	var authState: Observable<AuthState> { _authState.asObservable() }
	var counting: Observable<Int> { _counting.asObservable() }
	var showMenu: Observable<Bool> { _showMenu.asObservable() }
	
	func gotoItemDetail(item: TopSearchView.FruitItem) { _detail.onNext(item) }
	func gotoFacebook() { _home.onNext(Void()) }
	func gotoPrivacy() { print("Move to privacy by coordinator") }
	func gotoHelp() { print("Move to help by coordinator") }
	func gotoSetting() { print("Move to setting by coordinator") }
}
