//
//  Rules.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 06/04/2022.
//

import SwiftUI

///
///
///	EVERY CREATED SCREEN MUST BE CONFIRMED TO THESE PROTOCOLS
///
///
protocol CoordinatorRule {
}

protocol ViewModelRule: ObservableObject {
	associatedtype C where C: CoordinatorRule
	var coordinator: C { get }
}

protocol ViewDataRule {
	associatedtype T
	var asViewData: T { get }
}

protocol ViewRule {
	associatedtype VM where VM: ViewModelRule, VM: ViewDataRule
	var viewModel: VM { get }
	
	associatedtype I
	var viewData: I { get }
}

///
///
///	THIS IS SAMPLE TO USE THESE RULES
///
///
///

// COORDINATOR
fileprivate class SampleCoor: CoordinatorRule {
}

// VIEWMODEL
fileprivate class SampleViewModel: ViewModelRule {
	@Published var title: String = ""
	
	typealias C = SampleCoor
	let coordinator: C
	init(coordinator: C) {
		self.coordinator = coordinator
	}
}

// VIEW
fileprivate protocol SampleRequiredViewData {
	var title: String { get }
}

extension SampleViewModel: ViewDataRule, SampleRequiredViewData {
	typealias T = SampleRequiredViewData
	var asViewData: T {
		return self
	}
}

fileprivate struct SampleView<VM>: ViewRule where VM: ViewModelRule, VM: ViewDataRule {
	@ObservedObject var viewModel: VM
	typealias I = SampleRequiredViewData
	let viewData: I
	
	init(viewModel: VM) {
		self.viewModel = viewModel
		
		guard let viewData = viewModel.asViewData as? I else {
			fatalError("Your view model need to be confirm to view data")
		}
		
		self.viewData = viewData
	}
	
	var body: some View {
		Text("Hello, World!")
	}
}

// HOW TO USE IT???
private class DemoPreview {
	func execute() {
		let coordinator = SampleCoor()
		let viewModel = SampleViewModel(coordinator: coordinator)
		let contentView = SampleView(viewModel: viewModel)
		print(contentView)
	}
}

