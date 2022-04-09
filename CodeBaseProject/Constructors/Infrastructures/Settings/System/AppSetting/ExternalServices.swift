//
//  ExternalServices.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 09/04/2022.
//

enum ExternalServices {
	case facebook
	case google
	case firebase
	case networkLog
	case webSocket
	case networkSecurity
	case appSecurity
}

class ExternalServicesBuilder {
	typealias T = (success: Bool, error: Error?)
	private var error: Error?
	
	init() {
		fatalError("This type cannot be constructed directly, use static var 'builder' instead.")
	}
	
	static var builder: ExternalServicesBuilder {
		return ExternalServicesBuilder()
	}
}

extension ExternalServicesBuilder {
	func useService(_ service: ExternalServices) -> Self {
		switch service {
		case .facebook:
			PluginManager.shared.facebook.setup()
		case .google:
			PluginManager.shared.google.setup()
		case .firebase:
			PluginManager.shared.firebase.setup()
		case .networkLog:
			PluginManager.shared.networkLog.setup()
		case .webSocket:
			PluginManager.shared.webSocket.setup()
		case .networkSecurity:
			PluginManager.shared.networkSecurity.setup()
		case .appSecurity:
			PluginManager.shared.appSecurity.setup()
		}
		
		return self
	}
}

// MARK: - ================================= Usage =================================
extension ExternalServicesBuilder: Builder {
	func build() -> T {
		return (error != nil, error)
	}
}
