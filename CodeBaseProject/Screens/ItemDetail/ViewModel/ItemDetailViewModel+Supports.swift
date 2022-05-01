//
//  ItemDetailViewModelImpl+Supports.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 16/04/2022.
//

import RxSwift
import Combine

// MARK: - ================================= Coordinator support =================================
extension ItemDetailViewModelImpl: ItemDetailViewModelCoordSupport {
}

// MARK: - ================================= View support =================================
extension ItemDetailViewModelImpl: ItemDetailViewModelViewSupport {
	func gotoSomeWhere() {
		// go some where
	}
}
