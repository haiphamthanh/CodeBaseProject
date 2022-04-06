//
//  AppRootView.swift
//  TBVCommunity
//
//  Created by HaiKaito on 13/07/2021.
//

import SwiftUI


struct AppRootViewData {
	let string: String
}

struct AppRootView<VM>: ViewRule where VM: ViewModelRule, VM: ViewDataRule {
	@ObservedObject var viewModel: VM
	
	@State private var viewData: AppRootViewData?
	init(viewModel: VM) {
		self.viewModel = viewModel
		self.viewData = viewModel.asViewData as? AppRootViewData
	}
	
	var body: some View {
		Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
	}
	
	//    var body: some View {
	//        Group {
	//            if viewModel.loading {
	//                SplashView()
	//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
	//            } else {
	//                switch viewModel.appState {
	//                case .authorized:
	//                    NavigationView {
	//                        BaseCoordinator().homeView()
	//                    }
	//                    .navigationViewStyle(StackNavigationViewStyle())
	//                case .unAuthorized:
	//                    NavigationView {
	//                        BaseCoordinator().signInView()
	//                    }
	//                    .navigationViewStyle(StackNavigationViewStyle())
	//                }
	//            }
	//        }
	//    }
}
