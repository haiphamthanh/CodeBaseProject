////
////  MainView.swift
////  CodeBaseProject
////
////  Created by HaiKaito on 12/03/2022.
////
//
//import SwiftUI
//import Swinject
//
//struct MainView: View {
//	var body: some View {
//			Group {
//				NavigationView {
//					  VStack(spacing: 30) {
//						  Text("You're going to flip a coin – do you want to choose heads or tails?")
//
//						  NavigationLink(destination: rootView()) {
//							  Text("Choose Heads")
//						  }
//					  }
//					  .navigationTitle("Navigation")
//				}
//			}
//	}
//
//	func gotoSomeWhere() {
//		let viewModel: AppRootViewModel = AppRootViewModelImpl()
//		let viewModelAdapter = AppRootViewModelAdapter(viewModel: viewModel)
//		let view = AnyView(AppRootView(pros: viewModelAdapter))
//		let navigator = DefaultNavigation()
//
//		guard let viewModelWithCoorSupport = viewModel as? AppRootViewModelCoorSupport else {
//			return
//		}
//
//		let coordinator: AppRootCoordinator = AppRootCoordinatorImpl(navigator: navigator,
//																	 viewModel: viewModelWithCoorSupport,
//																	 view: view)
//	}
//
//	func rootView() -> AnyView? {
////		guard let view: AppRootView<AppRootViewModel> = rootViewConstructor() else {
////			return nil
////		}
////
////		return AnyView(view)
//		return nil
//	}
////
////	func rootViewConstructor<VM>() -> AppRootView<VM>? {
////		let navigator = DefaultNavigation()
////		let coordinator = AppRootCoordinator(navigator: navigator)
////		guard let rootViewModel = AppRootViewModel(coordinator: coordinator) as? VM else {
////			return nil
////		}
////
////		return AppRootView<VM>(viewModel: rootViewModel)
////	}
//
////	func sample() {
////		let containter = Container()
////		containter.register(AppRootCoordinatorProtocol.self) { r in
////			let navigator = containter.sureResolve(NavigationProvider.self)
////			let viewModel = containter.sureResolve(AppRootViewModelProtocol.self)
////			let rootViewModel = containter.sureResolve(AppRootViewModelProtocol.self)
////			guard let rootViewModel = containter.sureResolve(AppRootViewModelProtocol.self) as? ViewModelRule,
////			rootViewModel is AppRootViewModelProtocol else {
////				fatalError("")
////			}
//
////			let viewR = containter.sureResolve(AppRootViewProtocol.self)
//
////			guard let rootViewModel = containter.sureResolve(AppRootViewModelProtocol.self) as? ViewModelRule else {
////				fatalError("")
////			}
//
////			let viewR = containter.sureResolve(AppRootViewDataPolicy.self)
//
////			guard let viewR1 = containter.sureResolve(AppRootViewDataPolicy.self) as? UIViewController else {
////				fatalError("")
////			}
//
//
//
////			guard let viewR = containter.sureResolve(AppRootViewDataPolicy.self) as? AnyView else {
////				fatalError("")
////			}
//
////			guard let viewModel = ViewModelWrapper(data: rootViewModel as! AppRootViewModelProtocol) as? AppRootViewModelProtocol else {
////				fatalError("")
////			}
////			let pros = AppRootPros(viewModel: viewModel)
////			let viewR = AppRootView(pros: pros)
////
////			let coor = AppRootCoordinator(view: AnyView(viewR), viewModel: viewModel, navigator: navigator)
////
////			return coor
////		}
////	}
//}
//struct MainView_Previews: PreviewProvider {
//	static var previews: some View {
//		MainView()
//	}
//}
