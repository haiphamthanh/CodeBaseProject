//
//  AppRootViewData.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 06/04/2022.
//

import SwiftUI

struct AppRootViewData {
	@State var appState: AppState
	@State var actionState: AppStateManager.ActionState
}

extension AppRootViewModel: ViewDataRule {
	typealias T = AppRootViewData
	var asViewData: T {
		return AppRootViewData(appState: appState, actionState: actionState)
	}
}
