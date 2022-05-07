//
//  TopViewModel+TopSearchView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 29/04/2022.
//

// MARK: - >>>>>>>>>>>> Support From TopView <<<<<<<<<<<<<<<<
extension TopViewModelImpl: TopSearchViewModelViewSupport {
	func didSelected(fruit: TopSearchView.FruitItem) {
		_detail.onNext(fruit)
	}
}
