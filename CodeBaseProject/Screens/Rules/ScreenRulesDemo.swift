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

// VIEWMODEL
protocol SampleViewModel: ViewModelRule {
	var title: String { get set }
	func go()
}

private class SampleViewModelImp: SampleViewModel {
	func go() {
		print("Go some where")
	}
	
	@Published var title: String = ""
}

// VIEW
private protocol SampleViewPros: ObservableObject {
	var title: String { get set }
	
	func go()
}

class SampleViewModelAdapter: SampleViewPros {
	var title: String {
		get { viewModel.title }
		set { viewModel.title = newValue }
	}
	
	func go() {
		viewModel.go()
	}
	
	private var viewModel: SampleViewModel
	init(viewModel: SampleViewModel) {
		self.viewModel = viewModel
	}
}

private struct SampleView<IPros: SampleViewPros>: View, ViewRule {
	@ObservedObject var pros: IPros
	
	init(pros: IPros) {
		self.pros = pros
	}
	
	var body: some View {
		Text("Hello, World!")
	}
}

// COORDINATOR
private protocol SampleCoor {
}

private class SampleCoorImpl: CoordinatorRule, SampleCoor {
	typealias ViewModel = SampleViewModel
	typealias Navigator = NavigationProvider
	let navigator: Navigator
	let viewModel: ViewModel
	let view: AnyView
	
	init(navigator: Navigator, viewModel: ViewModel, view: AnyView) {
		self.navigator = navigator
		self.viewModel = viewModel
		self.view = view
	}
}

import Swinject

// HOW TO USE IT???
private class DemoPreview {
	func execute() {
//		let viewModel: SampleViewModel = SampleViewModelImp()
//		let viewModelAdapter = SampleViewModelAdapter(viewModel: viewModel)
//		let view = AnyView(SampleView(pros: viewModelAdapter, act: viewModelAdapter))
//		let navigator = DefaultNavigation()
//		let coordinator: SampleCoor = SampleCoorImpl(navigator: navigator, viewModel: viewModel, view: view)
		
		let container = Container()
		let viewModel: SampleViewModel = container.sureResolve(SampleViewModel.self)
		let viewModelAdapter = SampleViewModelAdapter(viewModel: viewModel)
		let view = AnyView(SampleView(pros: viewModelAdapter))
		let navigator = container.sureResolve(NavigationProvider.self)
		let coordinator: SampleCoor = SampleCoorImpl(navigator: navigator, viewModel: viewModel, view: view)
		
		print(coordinator)
	}
}
