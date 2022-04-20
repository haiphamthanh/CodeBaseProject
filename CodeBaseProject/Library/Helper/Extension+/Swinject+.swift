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
}

@propertyWrapper struct Inject<T> {
	let wrappedValue: T
	
	init() {
		self.wrappedValue = AppProvider.shared.container.sureResolve(T.self)
	}
}
