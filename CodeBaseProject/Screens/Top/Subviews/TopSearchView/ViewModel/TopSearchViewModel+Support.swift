//
//  TopSearchViewModel+Support.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 29/04/2022.
//

import RxSwift

// MARK: - ================================= View support =================================
extension TopSearchViewModelImpl: TopSearchViewModelViewSupport {
	func didSelected(fruit: TopSearchView.FruitItem) {
		delegator?.didSelected(fruit: fruit)
	}
}
