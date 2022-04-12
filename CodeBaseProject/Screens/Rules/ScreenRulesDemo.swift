//
//  ScreenRulesDemo.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 06/04/2022.
//

///
///
///	EVERY CREATED SCREEN MUST BE CONFIRMED TO THESE PROTOCOLS
///
///
import SwiftUI

// COORDINATOR
private class SampleCoor: CoordinatorRule {
	typealias N = NavigationProvider
	let navigator: N
	init(navigator: NavigationProvider) {
		self.navigator = navigator
	}
}

// VIEWMODEL
private class SampleViewModel: ViewModelRule {
	@Published var title: String = ""
	
	typealias C = SampleCoor
	let coordinator: C
	init(coordinator: C) {
		self.coordinator = coordinator
	}
}

// VIEW
private protocol SampleViewDataPolicy: ObservableObject {
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
private struct SampleView<VM: SampleViewDataPolicy>: View, ViewRule where VM: ViewModelRule {
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
		let navigator = DefaultNavigation()
		let coordinator = SampleCoor(navigator: navigator)
		let viewModel = SampleViewModel(coordinator: coordinator)
		let contentView = SampleView(viewModel: viewModel)
		print(contentView)
	}
}

