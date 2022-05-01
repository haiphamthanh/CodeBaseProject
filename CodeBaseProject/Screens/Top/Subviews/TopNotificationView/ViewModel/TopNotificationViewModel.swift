//
//  TopNotificationViewModel.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 29/04/2022.
//

import RxSwift

/// ViewModel Out
/// ViewModel Identify
protocol TopNotificationViewModel {
}

protocol TopNotificationViewModelDelegate: AnyObject {
}

class TopNotificationViewModelImpl: DefaultViewModel<Void>, ViewModelRule, TopNotificationViewModel {
	var delegator: TopNotificationViewModelDelegate? {
		return delegate as? TopNotificationViewModelDelegate
	}
}
