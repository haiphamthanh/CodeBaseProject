//
//  ScreenRulesDemo.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 06/04/2022.
//

/*

///
///
///	EVERY CREATED SCREEN MUST BE CONFIRMED TO THESE PROTOCOLS
///
///
import SwiftUI
import RxSwift

// VIEWMODEL
protocol DemoViewModel {
	var title: String { get set }
	func go()
}

protocol DemoViewModelCoorSupport {
	// MARK: Coordinator - Outputs
	var transitSomeWhere: Observable<Void> { get }
}

class DemoViewModelImp: ViewModelRule, DemoViewModel {
	// Rxswif support
	private let _somewhere = PublishSubject<Void>()
	
	func go() {
		print("Go some where")
	}
	
	@Published var title: String = ""
}

// MARK: - ================================= Coordinator - Outputs =================================
extension DemoViewModelImp: DemoViewModelCoorSupport {
	var transitSomeWhere: Observable<Void> {
		return _somewhere.asObserver()
	}
}

// VIEW
protocol DemoViewProps: ObservableObject {
	var title: String { get set }
	
	func go()
}

class DemoViewModelAdapter: DemoViewProps {
	var title: String {
		get { viewModel.title }
		set { viewModel.title = newValue }
	}
	
	func go() {
		viewModel.go()
	}
	
	private var viewModel: DemoViewModel
	init(viewModel: DemoViewModel) {
		self.viewModel = viewModel
	}
}

struct DemoView<IProps: DemoViewProps>: View, ViewRule {
	@ObservedObject var props: IProps
	
	init(props: IProps) {
		self.props = props
	}
	
	var body: some View {
		Text("Hello, World!")
	}
}

// COORDINATOR
protocol DemoCoor {
}

class DemoCoorImpl: CoordinatorAdapter<Void>, CoordinatorRule, DemoCoor {
	typealias ViewModel = DemoViewModelCoorSupport
	typealias Navigator = NavigationProvider
	let navigator: Navigator
	let viewModel: ViewModel
	let view: AnyView
	
	init(navigator: Navigator, viewModel: ViewModel, view: AnyView) {
		guard let validViewModel = viewModel as? ViewModelRule else {
			fatalError("Invalid view model")
		}
		
		self.navigator = navigator
		self.viewModel = viewModel
		self.view = view
		super.init(viewModel: validViewModel)
	}
}

extension DemoCoorImpl {
	static func registerStory() -> DemoCoorImpl {
		return DemoCoorImpl()
	}
}

import Swinject

// HOW TO USE IT???
private class DemoPreview {
	func execute() {
//		let viewModel: SampleViewModel = SampleViewModelImp()
//		let viewModelAdapter = SampleViewModelAdapter(viewModel: viewModel)
//		let view = AnyView(SampleView(props: viewModelAdapter, act: viewModelAdapter))
//		let navigator = DefaultNavigation()
//		let coordinator: SampleCoor = SampleCoorImpl(navigator: navigator, viewModel: viewModel, view: view)
		
		let container = Container()
		let viewModel: DemoViewModel = container.sureResolve(DemoViewModel.self)
		let viewModelAdapter = DemoViewModelAdapter(viewModel: viewModel)
		let view = AnyView(DemoView(props: viewModelAdapter))
		let navigator = container.sureResolve(NavigationProvider.self)
		
		guard let viewModelWithCoorSupport = viewModel as? DemoViewModelCoorSupport else {
			return
		}
		
		let coordinator: DemoCoor = DemoCoorImpl(navigator: navigator,
													 viewModel: viewModelWithCoorSupport,
													 view: view)
		
		print(coordinator)
	}
}
*/
