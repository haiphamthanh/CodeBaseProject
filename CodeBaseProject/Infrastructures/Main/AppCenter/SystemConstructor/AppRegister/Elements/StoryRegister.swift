//
//  StoryRegister.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 20/04/2022.
//

import Swinject

class StoryRegister {
	private weak var container: Container!
	init(_ container: Container) {
		self.container = container
	}
	
	func start() {
		return registerStory()
	}
}

private extension StoryRegister {
	func registerStory() {
		//MARK: AppStory
		container.register(AppStoryViewModel.self) { _ in AppStoryViewModelImpl() }
		container.register(AppStory.self) { r in
			@Inject var viewModel: AppStoryViewModel
			guard let viewModel = viewModel as? ViewModelRule else {
				fatalError("View model need to confirm to ViewModelRule")
			}
			
			return AppStoryImpl(viewModel: viewModel)
		}
		
		//MARK: Proxy
		container.register(ProxyStoryViewModel.self) { _ in ProxyStoryViewModelImpl() }
		container.register(ProxyStory.self) { r in
			@Inject var viewModel: ProxyStoryViewModel
			guard let viewModel = viewModel as? ViewModelRule else {
				fatalError("View model need to confirm to ViewModelRule")
			}
			
			return ProxyStoryImpl(viewModel: viewModel)
		}
		
		//MARK: Introduction
		container.register(IntroStoryViewModel.self) { _ in IntroStoryViewModelImpl() }
		container.register(IntroStory.self) { r in
			@Inject var viewModel: IntroStoryViewModel
			guard let viewModel = viewModel as? ViewModelRule else {
				fatalError("View model need to confirm to ViewModelRule")
			}
			
			return IntroStoryImpl(viewModel: viewModel)
		}
		
		//MARK: Home
		container.register(HomeStoryViewModel.self) { _ in HomeStoryViewModelImpl() }
		container.register(HomeStory.self) { r in
			@Inject var viewModel: HomeStoryViewModel
			guard let viewModel = viewModel as? ViewModelRule else {
				fatalError("View model need to confirm to ViewModelRule")
			}
			
			return HomeStoryImpl(viewModel: viewModel)
		}
	}
}

