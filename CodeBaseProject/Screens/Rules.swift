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

protocol ViewRule: View {
	associatedtype VM where VM: ViewModelRule, VM: ViewDataRule
	var viewModel: VM { get }
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
fileprivate struct SampleViewData {
	let string: String
}

extension SampleViewModel: ViewDataRule {
	typealias T = SampleViewData
	var asViewData: T {
		return SampleViewData(string: title)
	}
}

fileprivate struct SampleView<VM>: ViewRule where VM: ViewModelRule, VM: ViewDataRule {
	@ObservedObject var viewModel: VM
	
	@State private var viewData: AppRootViewData?
	init(viewModel: VM) {
		self.viewModel = viewModel
		self.viewData = viewModel.asViewData as? AppRootViewData
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

