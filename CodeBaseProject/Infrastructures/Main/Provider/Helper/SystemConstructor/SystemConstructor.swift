//
//  SystemConstructor.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 10/04/2022.
//

import Swinject

class SystemConstructor {
	private weak var container: Container?
	init(container: Container?) {
		self.container = container
	}
}

extension SystemConstructor {
	func start() -> Bool {
		guard let container = container else {
			fatalError("You need to create container before using")
		}
		
		return register(to: container)
			.setupAppConnect()
			.applyAppTheme()
			.done()
	}
}

private extension SystemConstructor {
	func register(to container: Container) -> Self {
		return registerSystemProviders(to: container)
			.registerTools(to: container)
	}
	
	func done() -> Bool{
		//TODO: Implement later
		return true
	}
}
