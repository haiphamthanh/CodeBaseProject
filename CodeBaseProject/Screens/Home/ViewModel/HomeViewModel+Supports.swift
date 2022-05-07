//
//  HomeViewModel+Supports.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 16/04/2022.
//

import RxSwift
import Combine

// MARK: - ================================= Coordinator support =================================
extension HomeViewModelImpl: HomeViewModelCoordSupport {
	var goDetail: Observable<TopSearchView.FruitItem> {
		return _detail
	}
}

// MARK: - ================================= View support =================================
extension HomeViewModelImpl: HomeViewModelViewSupport {
	func gotoSomeWhere() {
		_detail.onNext(TopSearchView.FruitItem(id: UUID(), name: "Banana 🍌"))
	}
}
