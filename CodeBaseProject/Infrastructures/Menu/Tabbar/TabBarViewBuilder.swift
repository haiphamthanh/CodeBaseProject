//
//  TabBarViewBuilder.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 29/04/2022.
//

import SwiftUI

enum TopViewPropType {
	case topHome(TopHomeView.IPros)
	case topSearch
	case topNoti
	case topVideo
	
	var viewModel: ViewModelRule {
		switch self {
		case .topHome(let topHomeProp):
			return topHomeProp.ruleViewModel
		case .topSearch:
			fatalError("Implement later")
		case .topNoti:
			fatalError("Implement later")
		case .topVideo:
			fatalError("Implement later")
		}
	}
}

// Main
class TabBarViewBuilder {
	static let builder = TabBarViewBuilder()
	private init() { }
	
	private weak var topHomeProps: TopHomeView.IPros?
}

// Views
extension TabBarViewBuilder {
	var topHomeView: AnyView {
		guard let topHomeProps = topHomeProps else {
			fatalError("Props can not be founded")
		}
		
		return ViewInstance.SubView.topHomeView(pros: topHomeProps)
	}
}

// Usage
extension TabBarViewBuilder {
	func hold(_ prop: TopViewPropType) -> Self {
		switch prop {
		case .topHome(let topHomeProp):
			self.topHomeProps = topHomeProp
		case .topSearch:
			break
		case .topNoti:
			break
		case .topVideo:
			break
		}
		
		return self
	}
	
	func build() -> Bool {
		return true
	}
}
