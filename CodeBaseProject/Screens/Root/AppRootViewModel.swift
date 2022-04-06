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

class AppRootViewModel: ViewModelRule {
	typealias C = AppRootCoordinator
	let coordinator: C
	
	@Published private(set) var appState: AppState = .unAuthorized
	@Published private(set) var actionState: AppStateManager.ActionState = .free
	
	private var authorized: Bool = false
	private var disposables = Set<AnyCancellable>()
	private var listActionId = [UUID]()
	
	
	init(coordinator: C) {
		self.coordinator = coordinator
	}
}
