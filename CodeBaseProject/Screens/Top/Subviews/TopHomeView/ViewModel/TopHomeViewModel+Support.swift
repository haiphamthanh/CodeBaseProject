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
		print("Go to \(#function)")
		delegate?.avatarButtonHandler()
	}
	
	func settingButtonHandler() {
		print("Settomg to \(#function)")
		delegate?.settingButtonHandler()
	}
}
