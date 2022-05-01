//
//  ItemDetailViewModel.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 08/04/2022.
//

import RxSwift

/// ViewModel Out
/// ViewModel Identify
protocol ItemDetailViewModel {
}

class ItemDetailViewModelImpl: DefaultViewModel<TopSearchView.FruitItem>, ViewModelRule, ItemDetailViewModel {
	let _title = PublishSubject<String>()
	
	override func push(input: TopSearchView.FruitItem?) {
		super.push(input: input)
		
		_title.onNext(input?.name ?? "No name")
	}
}
