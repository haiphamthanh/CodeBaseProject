//
//  MainServices.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 09/04/2022.
//

import Swinject

enum MainServices {
	case container(Container)
}

class MainServicesBuilder {
	typealias T = (success: Bool, error: Error?)
	private var error: Error?
	
	init() {
		fatalError("This type cannot be constructed directly, use static var 'builder' instead.")
	}
	
	static var builder: MainServicesBuilder {
		return MainServicesBuilder()
	}
}

extension MainServicesBuilder {
	func useService(_ service: MainServices) -> Self {
		switch service {
		case .container(let container):
			//TODO: Setting up for container
			break
		}
		
		return self
	}
}

// MARK: - ================================= Usage =================================
extension MainServicesBuilder: Builder {
	func build() -> T {
		return (error != nil, error)
	}
}
