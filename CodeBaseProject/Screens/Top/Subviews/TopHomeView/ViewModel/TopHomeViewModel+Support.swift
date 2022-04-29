//
//  TopHomeViewModel+Support.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 25/04/2022.
//

import RxSwift

// MARK: - ================================= View support =================================
extension TopHomeViewModelImpl: TopHomeViewModelViewSupport {
	func avatarButtonHandler() {
		delegator?.avatarButtonHandler()
	}
	
	func settingButtonHandler() {
		delegator?.settingButtonHandler()
	}
}
