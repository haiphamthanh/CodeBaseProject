//
//  TopViewModel+Supports.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 16/04/2022.
//

import RxSwift

// MARK: - ================================= Coordinator support =================================
extension TopViewModelImpl: TopViewModelCoordSupport {
	var goFacebook: Observable<Void> {
		return _intro
	}
	
	var goDetail: Observable<TopSearchView.FruitItem> {
		return _detail
	}
	
	var goHome: Observable<Void> {
		return _home
	}
}

// MARK: - ================================= View support =================================
extension TopViewModelImpl: TopViewModelViewSupport {
	var authState: Observable<AuthState> { _authState }
	var counting: Observable<Int> { _counting }
	
	func gotoItemDetail(item: TopSearchView.FruitItem) { _detail.onNext(item) }
	func gotoFacebook() { _home.onNext(Void()) }
	func gotoPrivacy() { _intro.onNext(Void()) }
	func gotoHelp() { print("Move to help by coordinator") }
	func gotoSetting() { print("Move to setting by coordinator") }
}
