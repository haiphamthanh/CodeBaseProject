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

protocol ViewModelRule {
	associatedtype C where C: CoordinatorRule
	var coordinator: C { get }
}

protocol ViewRule {
	associatedtype VM where VM: ViewModelRule
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
fileprivate protocol SampleViewDataPolicy: ObservableObject {
	var title: String { get }
	
	// Allow to add new properties
	var email2: String { get set }
}

extension SampleViewModel: SampleViewDataPolicy {
	var email2: String {
		get { title }
		set { title = newValue }
	}
}

//struct AppRootView<VM: AppRootViewDataPolicy>: ViewRule where VM: ViewModelRule {
fileprivate struct SampleView<VM: SampleViewDataPolicy>: View, ViewRule where VM: ViewModelRule {
	@ObservedObject var viewModel: VM
	
	init(viewModel: VM) {
		self.viewModel = viewModel
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

