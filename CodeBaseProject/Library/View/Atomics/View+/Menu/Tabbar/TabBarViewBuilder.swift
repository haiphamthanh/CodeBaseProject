//
//  TabBarViewBuilder.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 29/04/2022.
//

import SwiftUI

enum TopViewPropType {
	case topHome(TopHomeView.IPros)
	case topSearch(TopSearchView.IPros)
	case topNoti(TopNotificationView.IPros)
	case topVideo(TopVideoView.IPros)
	
	var viewModel: ViewModelRule? {
		switch self {
		case .topHome(let topHomeProp):
			return topHomeProp.viewModel
		case .topSearch(let topSearchProp):
			return topSearchProp.viewModel
		case .topNoti(let topNotiProp):
			return topNotiProp.viewModel
		case .topVideo(let topVideoProp):
			return topVideoProp.viewModel
		}
	}
}

// Main
class TabBarViewBuilder {
	static let builder = TabBarViewBuilder()
	private init() { }
	
	private weak var topHomeProp: TopHomeView.IPros?
	private weak var topSearchProp: TopSearchView.IPros?
	private weak var topNotiProp: TopNotificationView.IPros?
	private weak var topVideoProp: TopVideoView.IPros?
}

// Views
extension TabBarViewBuilder {
	var topHomeView: AnyView {
		guard let topHomeProp = topHomeProp else {
			fatalError("Props can not be founded")
		}
		return ViewInstance.SubView.topHomeView(pros: topHomeProp)
	}
	var topSearchView: AnyView {
		guard let topSearchProp = topSearchProp else {
			fatalError("Props can not be founded")
		}
		return ViewInstance.SubView.topSearchView(pros: topSearchProp)
	}
	var topNotiView: AnyView {
		guard let topNotiProp = topNotiProp else {
			fatalError("Props can not be founded")
		}
		return ViewInstance.SubView.topNotiView(pros: topNotiProp)
	}
	var topVideoView: AnyView {
		guard let topVideoProp = topVideoProp else {
			fatalError("Props can not be founded")
		}
		return ViewInstance.SubView.topVideoView(pros: topVideoProp)
	}
}

// Usage
extension TabBarViewBuilder {
	func hold(_ prop: TopViewPropType) -> Self {
		switch prop {
		case .topHome(let topHomeProp):
			self.topHomeProp = topHomeProp
		case .topSearch(let topSearchProp):
			self.topSearchProp = topSearchProp
		case .topNoti(let topNotiProp):
			self.topNotiProp = topNotiProp
		case .topVideo(let topVideoProp):
			self.topVideoProp = topVideoProp
		}
		
		return self
	}
	
	func build() -> Bool {
		return true
	}
}
