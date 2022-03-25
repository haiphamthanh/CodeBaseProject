//
//  AppRootView.swift
//  TBVCommunity
//
//  Created by HaiKaito on 13/07/2021.
//

import SwiftUI

struct AppRootView<VM>: View where VM: AppRootViewModel {
    @ObservedObject var viewModel: VM
	
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
