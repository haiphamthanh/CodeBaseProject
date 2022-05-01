//
//  TopVideoViewModel.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 29/04/2022.
//

import RxSwift

/// ViewModel Out
/// ViewModel Identify
protocol TopVideoViewModel {
}

protocol TopVideoViewModelDelegate: AnyObject {
}

class TopVideoViewModelImpl: DefaultViewModel<Void>, ViewModelRule, TopVideoViewModel {
	var delegator: TopVideoViewModelDelegate? {
		return delegate as? TopVideoViewModelDelegate
	}
}
