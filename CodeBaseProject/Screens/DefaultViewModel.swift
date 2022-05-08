//
//  DefaultViewModel.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 15/04/2022.
//

import RxSwift

class DefaultViewModel<Input> {
	let id: UUID = UUID()
	let disposeBag = DisposeBag()
	let _done = PublishSubject<Void>()
	private(set) weak var delegate: AnyObject?
	private(set) var input: Input?
	
	// MARK: - ================================= Init =================================
	required init() { }
	
	final func delegate(_ sender: AnyObject?) {
		self.delegate = sender
	}
	
	func push(input: Input?) {
		self.input = input
	}
	
	deinit {
		_done.onNext(())
		_ = AppCenter.Manager.modelId.deAttach(id)
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
	var didDone: Observable<Void> { return _done }
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
