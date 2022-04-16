//
//  UIRegister.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 12/04/2022.
//

import Swinject

class UIRegister {
	// MARK: - ================================= Private Properties =================================
	private let container: Container
	
	// MARK: - ================================= Initialize =================================
	//+++ DependencyService =======
	init(container: Container) {
		self.container = container
	}
	
	func start() {
		return registerUserInterface()
	}
}

// MARK: - ================================= Register =================================
private extension UIRegister {
	func registerUserInterface() {
		//MARK: ------------------------------------ INTRODUCTION ------------------------------------
		container.register(IntroViewModel.self) { _ in IntroViewModelImpl() }
		container.register(IntroCoordinator.self) { r in
			guard let viewModel = r.sureResolve(IntroViewModel.self) as? ViewModelRule else {
				fatalError("View model need to confirm to ViewModelRule")
			}
			
			let view = ViewInstance.introView(viewModel: viewModel)
			return IntroCoordinatorImpl(view: view, viewModel: viewModel)
		}
		
		//MARK: ------------------------------------ ROOT ------------------------------------
		container.register(RootViewModel.self) { _ in RootViewModelImpl() }
		container.register(RootCoordinator.self) { r in
			guard let viewModel = r.sureResolve(RootViewModel.self) as? ViewModelRule else {
				fatalError("View model need to confirm to ViewModelRule")
			}
			
			let view = ViewInstance.rootView(viewModel: viewModel)
			return RootCoordinatorImpl(view: view, viewModel: viewModel)
		}
		
		//MARK: ------------------------------------ HOME ------------------------------------
		container.register(HomeViewModel.self) { _ in HomeViewModelImpl() }
		container.register(HomeCoordinator.self) { r in
			guard let viewModel = r.sureResolve(HomeViewModel.self) as? ViewModelRule else {
				fatalError("View model need to confirm to ViewModelRule")
			}
			
			let view = ViewInstance.homeView(viewModel: viewModel)
			return HomeCoordinatorImpl(view: view, viewModel: viewModel)
		}
	}
}
