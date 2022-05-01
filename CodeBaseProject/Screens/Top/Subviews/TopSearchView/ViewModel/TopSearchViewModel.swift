//
//  TopSearchViewModel.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 29/04/2022.
//

import RxSwift

/// ViewModel Out
/// ViewModel Identify
protocol TopSearchViewModel {
}

protocol TopSearchViewModelDelegate: AnyObject {
	func didSelected(fruit: TopSearchView.FruitItem)
}

class TopSearchViewModelImpl: DefaultViewModel<Void>, ViewModelRule, TopSearchViewModel {
	var delegator: TopSearchViewModelDelegate? {
		return delegate as? TopSearchViewModelDelegate
	}
}
