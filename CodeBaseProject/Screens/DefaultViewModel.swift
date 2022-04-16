//
//  DefaultViewModel.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 15/04/2022.
//

import RxSwift

class DefaultViewModel {
	// MARK: - ================================= Properties =================================
	let disposeBag = DisposeBag()
	let pDone = PublishSubject<Void>()
	
	
	// MARK: - ================================= Init =================================
	required init() { }
	
	deinit {
		pDone.onNext(())
		print("\(self) is deinit")
	}
}

//// MARK: - ================================= BaseViewModelProtocol =================================
//extension DefaultViewModel: ViewModelRule {
//	var didAlert: AnyObserver<Void> {
//		return pdidAlert.asObserver()
//	}
//
//	func loadMore() -> Observable<Void> {
//		return loadMoreData()
//	}
//
//	var alert: Observable<AlertInput> {
//		return pAlert.asObserver()
//	}
//	var toast: Observable<String> {
//		return pToast
//	}
//	var dataSource: Observable<Any?> {
//		return pDataSource
//	}
//
//	func reload() -> Observable<Void> {
//		return reloadData()
//	}
//
//	func push(params: Dictionary<String, Any>?) {
//		initialize(params: params)
//		loadData()
//		refreshData()
//	}
//}

// MARK: - ================================= Outputs =================================
extension DefaultViewModel {
	var didDone: Observable<Void> {
		return pDone.asObservable()
	}
}

// MARK: - ================================= View - Outputs - Don't use directly =================================
//extension DefaultViewModel {
//	func clone(with newtype: DefaultViewModel.Type) -> ViewModelRule? {
//		guard let newInstance = newtype.init() as? ViewModelRule else {
//			return nil
//		}
//
//		return newInstance
//	}
//}
