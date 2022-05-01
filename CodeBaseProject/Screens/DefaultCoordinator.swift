//
//  DefaultCoordinator.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 13/04/2022.
//

import RxSwift
import SwiftUI

/// Base abstract coordinator generic over the return type of the `start` method.
class DefaultCoordinator<ResultType> {
	/// Typealias which will allows to access a ResultType of the Coordainator by `CoordinatorName.CoordinationResult`.
	typealias CoordinationResult = ResultType
	
	private(set) var result: ResultType!
	private let view: AnyView?
	private weak var viewModel: ViewModelRule?
	
	init(view: AnyView? = nil, viewModel: ViewModelRule? = nil) {
		self.view = view
		self.viewModel = viewModel
	}
	
	let disposeBag = DisposeBag()
	private let identifier = UUID()
	private var childCoordinators = [UUID: Any]()
	
	func customAction(on viewModel: ViewModelRule?,
					  view: AnyView?) -> Observable<ResultType> {
		fatalError("Start method should be implemented.")
	}
	
	deinit {
		print("\(self) is deinit")
	}
}

// MARK: - ########################## PUBLIC FUNCTION LIST ##########################
extension DefaultCoordinator {
	/// 1. Stores coordinator in a dictionary of child coordinators.
	/// 2. Calls method `start()` on that coordinator.
	/// 3. On the `onNext:` of returning observable of method `start()` removes coordinator from the dictionary.
	///
	/// - Parameter coordinator: Coordinator to start.
	/// - Returns: Result of `start()` method.
	func coordinate<T, ViewModelResult>(to coordinator: DefaultCoordinator<T>,
										input: ViewModelResult,
										on presentType: PresentType = .push) -> Observable<T> {
		store(coordinator: coordinator)
		coordinator.push(input: input)
		return coordinator.start(on: presentType)
			.do(onNext: { [weak self] _ in
				self?.free(coordinator: coordinator)
			})
	}
	
	/// Starts job of the coordinator.
	///
	/// - Returns: Result of coordinator job.
	func startProcess(on presentType: PresentType = .push) -> Observable<Void> {
		return start(on: presentType)
			.map({ [weak self] result in
				self?.result = result
			})
	}
}

// MARK: - ########################## PRIVATE FUNCTION LIST ##########################
private extension DefaultCoordinator {
	func start(on presentType: PresentType = .push) -> Observable<ResultType> {
		@Inject var navigator: NavigationProvider?
		if let view = view {
			switch presentType {
			case .`init`:
				AppCenter.shared.makeWindowVisible(on: view)
			case .push:
				navigator?.pushView(view, animated: true)
			case .present:
				navigator?.present(view, animated: true, completion: nil)
			case .resetStack:
				navigator?.resetStack(by: [view], animated: true)
			case .none:
				break
			}
		}
		
		return customAction(on: viewModel, view: view)
	}
	
	
	/// Stores coordinator to the `childCoordinators` dictionary.
	///
	/// - Parameter coordinator: Child coordinator to store.
	private func store<T>(coordinator: DefaultCoordinator<T>) {
		childCoordinators[coordinator.identifier] = coordinator
	}
	
	/// Release coordinator from the `childCoordinators` dictionary.
	///
	/// - Parameter coordinator: Coordinator to release.
	private func free<T>(coordinator: DefaultCoordinator<T>) {
		childCoordinators[coordinator.identifier] = nil
	}
	
	private func push<ViewModelResult>(input: ViewModelResult) {
		guard let viewModel = viewModel as? DefaultViewModel<ViewModelResult> else {
			return
		}
		
		viewModel.push(input: input)
	}
}
