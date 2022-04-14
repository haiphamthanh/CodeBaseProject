//
//  CoordinatorRule.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 08/04/2022.
//

import SwiftUI

protocol CoordinatorRule {
	associatedtype Navigator
	var navigator: Navigator { get }
	
	associatedtype ViewModel
	var viewModel: ViewModel { get }
	
	var view: AnyView { get }
}
