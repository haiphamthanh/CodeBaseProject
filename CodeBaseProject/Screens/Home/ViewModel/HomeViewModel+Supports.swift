//
//  HomeViewModel+Supports.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 16/04/2022.
//

import RxSwift
import Combine

// MARK: - ================================= Coordinator support =================================
extension IntroViewModelImpl: IntroViewModelCoordSupport {
}

// MARK: - ================================= View support =================================
extension IntroViewModelImpl: IntroViewModelViewSupport {
	func gotoSomeWhere() {
		// go some where
	}
}
