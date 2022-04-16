//
//  HomeView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 25/03/2022.
//

import SwiftUI

// ViewModel ===> View
protocol HomeViewModelViewSupport {
	func gotoSomeWhere()
}

struct HomeView {
	private init() { }
	
	// Properties is used for View
	class IPros: ObservableObject {
		typealias IndividualViewModel = HomeViewModelViewSupport
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
				Text("Home view")
				Button("Go to some where") {
					pros.gotoSomeWhere()
				}
				.frame(minWidth: 280, maxWidth: 400, idealHeight: 35, alignment: .leading)
				.background(Color.red)
			}
		}
	}
}
