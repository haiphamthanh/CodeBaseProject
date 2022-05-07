//
//  TabBarViewBuilder.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 29/04/2022.
//

import SwiftUI

enum TopViewPropType {
	case topHome(TopHomeView.IProps)
	case topSearch(TopSearchView.IProps)
	case topNoti(TopNotificationView.IProps)
	case topVideo(TopVideoView.IProps)
	
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
	
	private weak var topHomeProp: TopHomeView.IProps?
	private weak var topSearchProp: TopSearchView.IProps?
	private weak var topNotiProp: TopNotificationView.IProps?
	private weak var topVideoProp: TopVideoView.IProps?
}

// Views
extension TabBarViewBuilder {
	var topHomeView: AnyView {
		guard let topHomeProp = topHomeProp else {
			fatalError("Props can not be founded")
		}
		return ViewInstance.SubView.topHomeView(props: topHomeProp)
	}
	var topSearchView: AnyView {
		guard let topSearchProp = topSearchProp else {
			fatalError("Props can not be founded")
		}
		return ViewInstance.SubView.topSearchView(props: topSearchProp)
	}
	var topNotiView: AnyView {
		guard let topNotiProp = topNotiProp else {
			fatalError("Props can not be founded")
		}
		return ViewInstance.SubView.topNotiView(props: topNotiProp)
	}
	var topVideoView: AnyView {
		guard let topVideoProp = topVideoProp else {
			fatalError("Props can not be founded")
		}
		return ViewInstance.SubView.topVideoView(props: topVideoProp)
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
