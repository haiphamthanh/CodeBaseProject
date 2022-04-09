//
//  Container+.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 09/04/2022.
//

import Swinject

extension Container {
	func sureResolve<Service>(_ serviceType: Service.Type) -> Service {
		if let instance = resolve(serviceType) {
			return instance
		}
		
		fatalError("You need register for \(serviceType)")
	}
}

extension Resolver {
	func sureResolve<Service>(_ serviceType: Service.Type) -> Service {
		if let instance = resolve(serviceType) {
			return instance
		}
		
		fatalError("You need register for \(serviceType)")
	}
	
//	func promiseCoordinator<T: BaseCoordinatorProtocol>(view: BaseViewProtocol,
//														viewModel: BaseViewModelProtocol,
//														coordinator: T,
//														window: UIWindow? = nil) -> T {
//		let navService = sureResolve(BasicNavigationServiceProtocol.self)
//		let alert = sureResolve(AlertServiceProtocol.self)
//		let toast = sureResolve(ToastServiceProtocol.self)
//		let image = sureResolve(ImageServiceProtocol.self)
//
//		// Init view controller
//		view.initialize(viewModel: viewModel,
//						alert: alert,
//						toast: toast,
//						image: image)
//
//		// Config coordBag
//		let coordBag = AdapterCoordinator(window: window,
//										  viewModel: viewModel,
//										  view: view,
//										  navService: navService)
//
//		coordinator.setup(coorBag: coordBag)
//		return coordinator
//	}
}
