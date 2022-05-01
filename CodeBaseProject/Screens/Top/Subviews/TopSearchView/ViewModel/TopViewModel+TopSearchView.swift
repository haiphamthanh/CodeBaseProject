//
//  TopViewModel+TopSearchView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 29/04/2022.
//

extension TopViewModelImpl: TopSearchViewModelDelegate {
	func didSelected(fruit: TopSearchView.FruitItem) {
		_detail.onNext(fruit)
	}
}
