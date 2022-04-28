//
//  TabBarManager.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 28/04/2022.
//

import SwiftUI
import RxSwift

enum TopViewModelSubView {
	case topHome
	case topSearch
	case topNoti
	case topVideo
}

class TabBarManager {
	static let shared = TabBarManager()
	// Subs
	private var topHomeProps: TopHomeView.IPros?
	private var topHomeViewModel: TopHomeViewModel?
	
	private init() {
		@Inject var topHomeViewModel: TopHomeViewModel
		guard let topViewModelRule = topHomeViewModel as? ViewModelRule else {
			fatalError("View model need to confirm to ViewModelRule")
		}
		self.topHomeProps = PropsInstance.topHomeProps(viewModel: topViewModelRule)
		self.topHomeViewModel = topHomeViewModel
	}
}

// Getter Properties
extension TabBarManager {
	var topHomeView: AnyView {
		guard let topHomeProps = topHomeProps else {
			fatalError("Props can not be founded")
		}
		
		return ViewInstance.SubView.topHomeView(pros: topHomeProps)
	}
}

// Usage
extension TabBarManager {
	func delegate(to sender: Any) -> Bool {
		guard let sender = sender as? TopHomeViewModelDelegate else {
			return false
		}
		topHomeViewModel?.setDelegate(sender)
		
		return true
	}
	
	func invalidate() {
		topHomeProps = nil
		topHomeViewModel = nil
	}
}
