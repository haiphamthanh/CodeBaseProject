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
	func avatarButtonHandler()
	func settingButtonHandler()
}

class TopSearchViewModelImpl: DefaultViewModel, ViewModelRule, TopSearchViewModel {
	var delegator: TopSearchViewModelDelegate? {
		return delegate as? TopSearchViewModelDelegate
	}
}
