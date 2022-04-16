//
//  IntroView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 08/04/2022.
//

import SwiftUI

// ViewModel ===> View
protocol IntroViewModelViewSupport {
	func gotoSomeWhere()
}

struct IntroView {
	private init() { }
	
	// Properties is used for View
	class IPros: ObservableObject {
		typealias IndividualViewModel = IntroViewModelViewSupport
		private let indViewModel: IndividualViewModel
		init(viewModel: ViewModelRule) {
			guard let indViewModel = viewModel as? IndividualViewModel else {
				fatalError("View model need to support coordinator")
			}

			self.indViewModel = indViewModel
		}
		
		func gotoSomeWhere() {
			indViewModel.gotoSomeWhere()
		}
	}
	
	// MARK: - ================================= View Layout =================================
	struct IView: View, ViewRule {
		// MARK: Properties
		@ObservedObject var pros: IPros
		
		// MARK: Layout
		var body: some View {
			VStack {
				Text("Intro view")
				Button("Go to Home") {
					pros.gotoSomeWhere()
				}
				.frame(minWidth: 280, maxWidth: 400, idealHeight: 35, alignment: .leading)
				.background(Color.red)
			}
		}
	}
}
