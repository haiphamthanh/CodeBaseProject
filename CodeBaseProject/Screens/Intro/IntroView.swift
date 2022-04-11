//
//  IntroView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 08/04/2022.
//

import SwiftUI

// MARK: - ================================= View input requirements =================================
protocol IntroViewDataPolicy: ObservableObject {
}

// MARK: - ================================= View Layout =================================
struct IntroView<VM: IntroViewDataPolicy>: View, ViewRule where VM: ViewModelRule {
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

//struct IntroView_Previews: PreviewProvider {
//	static var previews: some View {
//		IntroView()
//	}
//}
