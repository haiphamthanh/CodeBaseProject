//
//  TopHomeViewModel.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 25/04/2022.
//

import RxSwift

/// ViewModel Out
/// ViewModel Identify
protocol TopHomeViewModel {
}

protocol TopHomeViewModelDelegate: AnyObject {
	func avatarButtonHandler()
	func settingButtonHandler()
}

class TopHomeViewModelImpl: DefaultViewModel, ViewModelRule, TopHomeViewModel {
	let _home = PublishSubject<Void>()
	var delegator: TopHomeViewModelDelegate? {
		return delegate as? TopHomeViewModelDelegate
	}
}
