//
//  MainView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 12/03/2022.
//

import SwiftUI

struct MainView: View {
	var body: some View {
		rootView()
	}
	
	func rootView() -> AnyView? {
		guard let view: AppRootView<AppRootViewModel> = rootViewConstructor() else {
			return nil
		}
		
		return AnyView(view)
	}
	
	func rootViewConstructor<VM>() -> AppRootView<VM>? {
		let coordinator = AppRootCoordinator()
		guard let rootViewModel = AppRootViewModel(coordinator: coordinator) as? VM else {
			return nil
		}
		
		return AppRootView<VM>(viewModel: rootViewModel)
	}
}

struct MainView_Previews: PreviewProvider {
	static var previews: some View {
		MainView()
	}
}
