//
//  TopViewModel+TopHomeView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 28/04/2022.
//

import RxSwift

extension TopViewModelImpl: TopHomeViewModelDelegate {
	func avatarButtonHandler() {
		_showMenu.onNext(true)
	}
	
	func settingButtonHandler() {
		//		PopupManager.shared
		//			.showAlert(title: "Sample", message: ""This is sample Pop Up"")
		//			.subscribe { value in
		//				print(value)
		//			}
		//			.disposed(by: disposeBag)
		
		PopupManager.shared.showToast("This is sample toast")
	}
}
