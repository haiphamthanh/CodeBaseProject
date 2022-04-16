//
//  AppRootViewModel.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 14/07/2021.
// https://www.swiftbysundell.com/articles/published-properties-in-swift/
//

//import Combine
//import RxSwift
//
//enum AuthState {
//	case authorized
//	case unAuthorized
//}
//
//protocol AppRootViewModel {
//	var authState: AuthState { get }
//	var email: String { get set }
//
//	// MARK: View Actions
//	func gotoSomeWhere()
//}
//
//protocol AppRootViewModelCoorSupport {
//	// MARK: Coordinator - Outputs
//	var transitSomeWhere: Observable<Void> { get }
//}
//
//class AppRootViewModelImpl: DefaultViewModel, AppRootViewModel {
//	@Published private(set) var authState: AuthState = .unAuthorized
//	@Published private(set) var actionState: AuthStateManager.ActionState = .free
//	@Published var email: String = ""
//
//	var textChanged = PassthroughSubject<AuthState, Never>()
//
//	private var authorized: Bool = false
//	private var disposables = Set<AnyCancellable>()
//	private var listActionId = [String]()
//	private var counting = 0
//
//	// Rxswif support
//	private let _somewhere = PublishSubject<Void>()
//
//	required init() {
//		super.init()
//
//		load()
//	}
//
//	func load() {
//		Task.detached {
//			self.authState = await self.changeStateAfter2Seconds()
//			self.textChanged.send(self.authState)
//			print("Changed state \(self.authState)")
//		}
//	}
//
//	@MainActor
//	private func changeStateAfter2Seconds() async -> AuthState{
//		// Delay of 7.5 seconds (1 second = 1_000_000_000 nanoseconds)
//		//		try? await Task.sleep(nanoseconds: 7_500_000_000)
//		try? await Task.sleep(nanoseconds: 2_000_000_000)
//		counting += 1
//		email = "\(counting)"
//		return await changeStateAfter2Seconds()
//	}
//}
//
//// MARK: - ================================= View Actions =================================
//extension AppRootViewModelImpl {
//	func gotoSomeWhere() {
//		// go some where
//	}
//}
//
//// MARK: - ================================= Coordinator - Outputs =================================
//extension AppRootViewModelImpl: AppRootViewModelCoorSupport {
//	var transitSomeWhere: Observable<Void> {
//		return _somewhere.asObserver()
//	}
//}
