//
//  AppRootView.swift
//  TBVCommunity
//
//  Created by HaiKaito on 13/07/2021.
//

import SwiftUI

struct AppRootView<VM>: ViewRule where VM: ViewModelRule, VM: ViewDataRule {
	@ObservedObject var viewModel: VM
	private var viewData: AppRootViewData
	
	init(viewModel: VM) {
		self.viewModel = viewModel
		guard let viewData = viewModel.asViewData as? AppRootViewData else {
			fatalError("Your view model need to be confirm to view data")
		}
		
		self.viewData = viewData
	}
	
	var body: some View {
		Group {
			switch viewData.appState {
			case .authorized:
				NavigationView {
					Text("Authorized")
				}
				.navigationViewStyle(StackNavigationViewStyle())
			case .unAuthorized:
				NavigationView {
					Text("UnAuthorized")
				}
				.navigationViewStyle(StackNavigationViewStyle())
			}
		}
	}}
