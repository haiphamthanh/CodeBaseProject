//
//  HomeViewModel.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 25/03/2022.
//

import RxSwift

/// ViewModel Out
/// ViewModel Identify
protocol HomeViewModel {
}

class HomeViewModelImpl: DefaultViewModel<Void>, ViewModelRule, HomeViewModel {
	let _detail = PublishSubject<TopSearchView.FruitItem>()
}
