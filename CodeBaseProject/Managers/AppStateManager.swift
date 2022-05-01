//
//  AppStateManager.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 04/04/2022.
//

import Foundation

typealias ActionKey = String
protocol AppActions {
	func actionInBackground(actionKey: String)
	func actionWithIndicator(actionKey: String)
}

class AppStateManager {
	enum ActionState {
		case free
		case loading
		case busy
		case untrack
	}
	
	@Published private(set) var finishAction: ActionKey?
	@Published private(set) var currentAction: ActionState = .free
	
	private var listActionKey = [ActionKey]()
	
	var allowNextAction: Bool {
		return currentAction == .free
	}
	
	static let shared = AppStateManager()
	private init() {
	}
}

extension AppStateManager: AppActions {
	func actionInBackground(actionKey: ActionKey) {
		listActionKey.append(actionKey)
	}
	
	func actionWithIndicator(actionKey: ActionKey) {
		listActionKey.append(actionKey)
	}
}
