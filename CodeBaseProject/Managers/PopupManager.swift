//
//  PopupManager.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 30/04/2022.
//

/// Manage popup and toast view

import RxSwift

class PopupManager {
	static let shared = PopupManager()
	@Inject private var alert: AlertProvider
	@Inject private var toast: ToastProvider
	
	func showAlert(title: String? = nil, message: String) -> Observable<AlertProvider.Output> {
		let alerInput = AlertProvider.Input(title: title, message: message)
		return showAlert(alerInput)
	}
	
	func showToast(_ message: String) {
		return toast.show(message: message)
	}
}

private extension PopupManager {
	func showAlert(_ input: AlertProvider.Input) -> Observable<AlertProvider.Output> {
		return alert.show(input)
	}
}
