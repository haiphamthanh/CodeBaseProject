//
//  IntroViewModel+Supports.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 16/04/2022.
//

import RxSwift
import Combine

// MARK: - ================================= Coordinator support =================================
extension HomeViewModelImpl: IntroViewModelCoordSupport {
}

// MARK: - ================================= View support =================================
extension HomeViewModelImpl: HomeViewModelViewSupport {
	func gotoSomeWhere() {
		// go some where
	}
}
