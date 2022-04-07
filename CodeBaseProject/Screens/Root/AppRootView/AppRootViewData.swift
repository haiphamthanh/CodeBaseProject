//
//  AppRootViewData.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 06/04/2022.
//

import SwiftUI
//import Combine
//
//class AppRootViewData {
//	var disposables = Set<AnyCancellable>()
//	//	var appState: AnyPublisher<AppState, Never>
//	@Published var appState: AppState = .unAuthorized
//	@Published var email: String = ""
//	init(abc: AnyPublisher<AppState, Never>,
//		 bdf: AnyPublisher<String, Never>) {
//		abc, AppRootViewData, AppRootViewData
//			.assign(to: \.appState, on: self)
//			.store(in: &disposables)
//		
//		bdf
//			.assign(to: \.email, on: self)
//			.store(in: &disposables)
//	}
//}
//
//extension AppRootViewModel: ViewDataRule, AppRootViewData {
//	typealias T = AppRootViewData
//	var asViewData: T {
//		return self
////		return AppRootViewData(abc: $appState.eraseToAnyPublisher(), bdf: $email.eraseToAnyPublisher())
//		//		return AppRootViewData(appState: textChanged.eraseToAnyPublisher())
//	}
//}
