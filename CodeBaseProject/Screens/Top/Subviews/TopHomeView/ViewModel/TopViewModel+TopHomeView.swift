//
//  TopViewModel+TopHomeView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 28/04/2022.
//

import RxSwift

extension TopViewModelImpl: TopHomeViewModelDelegate {
	func avatarButtonHandler() {
		let notification = Notification(name: AppNotificationData.didOpenMenu, object: nil, userInfo: nil)
		NotificationCenter.default.post(notification)
	}
	
	func settingButtonHandler() {
		AppCenter.Manager.popup
			.showAlert(title: "Sample", message: "This is sample Pop Up")
			.subscribe { value in
				print(value)
			}
			.disposed(by: disposeBag)
		
		AppCenter.Manager.popup.showToast("This is sample toast")
	}
}
