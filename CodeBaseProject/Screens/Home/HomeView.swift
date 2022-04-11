//
//  HomeView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 25/03/2022.
//

import SwiftUI

// MARK: - ================================= View input requirements =================================
protocol HomeViewDataPolicy: ObservableObject {
}

// MARK: - ================================= View Layout =================================
struct HomeView<VM: HomeViewDataPolicy>: View, ViewRule where VM: ViewModelRule {
	// MARK: Properties
	@ObservedObject var viewModel: VM
	
	// MARK: Init
	init(viewModel: VM) {
		self.viewModel = viewModel
	}
	
	// MARK: Layout
	var body: some View {
		Button("Move") {
			// Goto some thing
		}
	}
}

//struct HomeView_Previews: PreviewProvider {
//	static var previews: some View {
//		IntroView()
//	}
//}
