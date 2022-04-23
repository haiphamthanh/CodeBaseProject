//
//  TopViewModel+Supports.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 16/04/2022.
//

import RxSwift

// MARK: - ================================= Coordinator support =================================
extension TopViewModelImpl: TopViewModelCoordSupport {
	var goHome: Observable<Void> {
		return _home
			.asObservable()
	}
}

// MARK: - ================================= View support =================================
extension TopViewModelImpl: TopViewModelViewSupport {
	var authState: Observable<AuthState> { _authState.asObservable() }
	var counting: Observable<Int> { _counting.asObservable() }
	
	func gotoHome() { _home.onNext(Void()) }
	func gotoSearch() { print("Move to search by coordinator") }
	func gotoNotifiction() { print("Move to notification by coordinator") }
	func gotoVideo() { print("Move to video by coordinator") }
	func gotoFacebook() { print("Move to facebook by coordinator") }
	func gotoPrivacy() { print("Move to privacy by coordinator") }
	func gotoHelp() { print("Move to help by coordinator") }
	func gotoSetting() { print("Move to setting by coordinator") }
}

