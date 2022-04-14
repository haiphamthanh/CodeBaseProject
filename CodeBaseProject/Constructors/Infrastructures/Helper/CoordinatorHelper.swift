//
//  CoordinatorHelper.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 13/04/2022.
//

import RxSwift
import Swinject
import SwiftUI

enum PresentType: Int {
	case push
	case present
	case updateRoot
}

/// Base abstract coordinator generic over the return type of the `start` method.
class CoordinatorAdapter<VM, ResultType> where VM: ViewModelRule{
	private(set) var result: ResultType!
	private let viewModel: VM
	init(viewModel: VM) {
		self.viewModel = viewModel
	}
	
	/// Typealias which will allows to access a ResultType of the Coordainator by `CoordinatorName.CoordinationResult`.
	typealias CoordinationResult = ResultType
	
	/// Utility `DisposeBag` used by the subclasses.
	let disposeBag = DisposeBag()
	
	/// Unique identifier.
	private let identifier = UUID()
	
	/// Dictionary of the child coordinators. Every child coordinator should be added
	/// to that dictionary in order to keep it in memory.
	/// Key is an `identifier` of the child coordinator and value is the coordinator itself.
	/// Value type is `Any` because Swift doesn't allow to store generic types in the array.
	private var childCoordinators = [UUID: Any]()
	
	
	/// Stores coordinator to the `childCoordinators` dictionary.
	///
	/// - Parameter coordinator: Child coordinator to store.
	private func store<T>(coordinator: CoordinatorAdapter<VM, T>) {
		childCoordinators[coordinator.identifier] = coordinator
	}
	
	/// Release coordinator from the `childCoordinators` dictionary.
	///
	/// - Parameter coordinator: Coordinator to release.
	private func free<T>(coordinator: CoordinatorAdapter<VM, T>) {
		childCoordinators[coordinator.identifier] = nil
	}
	
	/// 1. Stores coordinator in a dictionary of child coordinators.
	/// 2. Calls method `start()` on that coordinator.
	/// 3. On the `onNext:` of returning observable of method `start()` removes coordinator from the dictionary.
	///
	/// - Parameter coordinator: Coordinator to start.
	/// - Returns: Result of `start()` method.
	func coordinate<T>(to coordinator: CoordinatorAdapter<VM, T>) -> Observable<T> {
		store(coordinator: coordinator)
		return coordinator.start(viewModel: viewModel)
			.do(onNext: { [weak self] _ in
				self?.free(coordinator: coordinator)
			})
	}
	
	/// Starts job of the coordinator.
	///
	/// - Returns: Result of coordinator job.
//	func start() -> Observable<ResultType> {
//		fatalError("Start method should be implemented.")
//	}
//	var presentType: PresentType {
//		return .push
//	}
	
//	func doAction<VM>(viewModel: VM) -> Observable<ResultType> where VM: ViewModelRule{
//		fatalError("Start method should be implemented.")
//	}
	
	/// Starts job of the coordinator.
	///
	/// - Returns: Result of coordinator job.
	final func startProcess() -> Observable<Void> {
		return start(viewModel: viewModel)
			.map({ [weak self] result in
				self?.result = result
			})
	}
	
	func start(viewModel: VM) -> Observable<ResultType> {
		fatalError("Start method should be implemented.")
	}
	
	deinit {
		print("\(self) is deinit")
	}
}

// MARK: - ########################## PUBLIC FUNCTION LIST ##########################
extension CoordinatorAdapter {
//	//MARK: Getters
//	static var container: Container {
//		return AppDelegate.shared().container
//	}
//
//	var viewController: UIViewController {
//		guard let vc = coorBag?.view as? UIViewController else {
//			fatalError("Can't find view controller for. May be we current in story")
//		}
//
//		return vc
//	}
	
	
	//MARK: Functions
	// Finish the storyboard action
//	func doneStory() -> Observable<Void> {
//		return didFinishStory()
//	}
//
//	func doneStory(params: Dictionary<String, Any>?) -> Observable<Void> {
//		return didFinishStory(params: params)
//	}
	
	// Navigation actions
//	func navigationShouldAnimation(at point: CGPoint) {
//		guard let nav = coorBag?.navService.selectedNavigationController as? NavigationManager else {
//			return
//		}
//
//		nav.shouldAnimation(at: point)
//	}
	
//	func backToPreviousIfNeeded() {
//		guard let vc = coorBag?.view as? UIViewController else {
//			return
//		}
//
//		vc.navigationController?.popViewController(animated: true)
//	}
}

// MARK: - ########################## ONLY USE FOR BASE CONFIG ##########################
extension CoordinatorAdapter {
	/// Starts job of the coordinator.
	///
	/// - Returns: Result of coordinator job.
//	func startProcess() -> Observable<Void> {
//		return start(viewModel: viewModel)
//			.map({ [weak self] result in
//				self?.result = result
//			})
//	}
	
//	private func start() -> Observable<ResultType> {
//		if let coorBag = coorBag, let vc = coorBag.view as? AnyView {
//			func driverPusing() {
//				switch presentType {
//				case .push:
//					return coorBag.navService.push(viewController: vc, animated: true)
//				case .present:
//					return coorBag.navService.present(viewController: vc, animated: true, completion: nil)
//				case .updateRoot:
//					return coorBag.navService.resetStack(by: [vc], animated: true)
//				}
//			}
//
//			if !coorBag.isStoryInit {
//				driverPusing()
//			}
//		}
		
//		return doAction(viewModel: coorBag.viewModel)
//	}
	
	// Resolve instance Container+Extension.swift
//	func setup(coorBag: AdapterCoordinator) {
//		self.coorBag = coorBag
//	}
	
	// Push data at time when screens is transiting
//	func push(params: Dictionary<String, Any>?) {
//		coorBag?.viewModel.push(params: params)
//	}
	
	// Finish story
//	func didFinishStory(params: Dictionary<String, Any>? = nil) -> Observable<Void> {
//		let rootVC = UIApplication.shared.keyWindow?.rootViewController
//		if let rootNav = rootVC as? UINavigationController {
//			while rootNav.viewControllers.count > 0 {
//				rootNav.viewControllers.removeLast()
//			}
//		}
//
//		rootVC?.removeFromParent()
//		return Observable.never()
//	}
}

// MARK: ########################## ONLY USE FOR BASE CONFIG ##########################
//class CoordinatorBag<VM> where VM: ViewModelRule {
//	fileprivate let viewRule: ViewRule
//	fileprivate let viewModelRule: ViewModelRule
//	fileprivate let isStoryInit: Bool!
//
//	init(viewRule: ViewRule, viewModelRule: ViewModelRule) {
//		self.viewRule = viewRule
//		self.viewModelRule = viewModelRule
//		self.isStoryInit = false
//
////		guard let vc = view as? UIViewController, window != nil, window?.rootViewController == nil else {
////			self.isStoryInit = false
////			return
////		}
////
////		self.isStoryInit = true
////
////		// Setup root only storyboard switch
////		let nav = NavigationManager(rootViewController: vc)
////		navService.setup(with: nav)
////		window?.rootViewController = nav
////		window?.makeKeyAndVisible()
//	}
//
//	deinit {
//		print("\(self) is deinit")
//	}
//}

