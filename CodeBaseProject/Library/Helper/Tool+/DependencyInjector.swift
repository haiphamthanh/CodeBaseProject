//
//  DependencyInjector.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 26/03/2022.
//

/*
import Foundation

struct DependencyInjector {
	private static var dependencyList: [String:Any] = [:]
	
	static func resolve<T>() -> T {
		guard let t = dependencyList[String(describing: T.self)] as? T else {
			fatalError("No povider registered for type \(T.self)")
		}
		return t
	}
	
	static func register<T>(dependency: T) {
		dependencyList[String(describing: T.self)] = dependency
	}
}

@propertyWrapper struct Inject<T> {
	var wrappedValue: T
	
	init() {
		self.wrappedValue = DependencyInjector.resolve()
	}
}
*/
