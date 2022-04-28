//
//  TopViewModel+.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 28/04/2022.
//

extension TopViewModelImpl: TopHomeViewModelDelegate {
	func avatarButtonHandler() {
		_showMenu.onNext(true)
	}
	
	func settingButtonHandler() {
		print("did tap setting")
	}
}
