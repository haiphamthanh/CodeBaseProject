//
//  AppRootViewModel.swift
//  TBVCommunity
//
//  Created by HaiKaito on 14/07/2021.
// https://www.swiftbysundell.com/articles/published-properties-in-swift/
//
import Foundation
import SwiftUI
import Combine

enum AppState {
	case authorized
	case unAuthorized
}

protocol AppRootViewModel: ObservableObject {
	// Properties
//	var loading: Bool { get }
//	var appState: AppState { get }
	
	// Actions
}

class AppRootViewModelImpl: AppRootViewModel {
	@Published private(set) var appState: AppState = .unAuthorized
	@Published private(set) var actionState: AppStateManager.ActionState = .free
	
	private var authorized: Bool = false
	private var disposables = Set<AnyCancellable>()
	private var listActionId = [UUID]()
	
	private let coordinator: AppRootCoordinator
	
	init(coordinator: AppRootCoordinator) {
		self.coordinator = coordinator
		
//		AuthManager.shared
//			.$authState
//			.sink { [weak self] authState in
//				self?.didUpdateMainBoard(authState: authState)
//			}
//			.store(in: &subscribers)
//
//		AppStateManager.shared
//			.$finishActionId
//			.sink { [weak self] actionId in
//				self?.didUpdateMainBoard(authState: authState)
//			}
//			.store(in: &disposables)
		
		loadUserInfo()
	}
}

private extension AppRootViewModelImpl {
	func loadUserInfo() {
//		loading = true
		
//		AuthManager.shared.loadUserInfo() { [weak self] result in
//			if result {
//				DispatchQueue.main.async {
//					self?.loading = false
//				}
//			}
//		}
	}
	
//	func didUpdateMainBoard(authState: AuthState) {
//		let newAppState: AppState
//		switch authState {
//		case .isValid:
//			newAppState = .authorized
//		case .needActive, .verifyEmail, .error, .unChecked:
//			newAppState = .unAuthorized
//		}
//
//		if newAppState != self.appState {
//			self.appState = newAppState
//		}
//	}
	
	func didDoneActionId(_ actionId: UUID) {
		
	}
}
