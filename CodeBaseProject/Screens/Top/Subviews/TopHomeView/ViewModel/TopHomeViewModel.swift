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
	func setDelegate(_ sender: TopHomeViewModelDelegate)
}

protocol TopHomeViewModelDelegate: AnyObject {
	func avatarButtonHandler()
	func settingButtonHandler()
}

class TopHomeViewModelImpl: DefaultViewModel, ViewModelRule, TopHomeViewModel {
	let _home = PublishSubject<Void>()
	weak var delegate: TopHomeViewModelDelegate?
	func setDelegate(_ sender: TopHomeViewModelDelegate) {
		self.delegate = sender
	}
}
