//
//  ExternalPlugin.swift
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

class ExternalPluginsBuilder {
	typealias Result = (success: Bool, error: Error?)
	private var error: Error?
	
	private init() {
//		fatalError("This type cannot be constructed directly, use static var 'builder' instead.")
	}
	
	static var builder: ExternalPluginsBuilder {
		return ExternalPluginsBuilder()
	}
}

extension ExternalPluginsBuilder {
	func useExternalServices(_ services: [ExternalServices]) -> Self {
		for service in services {
			switch service {
			case .facebook:
				FacebookPlugin().setup()
			case .google:
				GooglePlugin().setup()
			case .firebase:
				FirebasePlugin().setup()
			case .networkLog:
				NetworkLogPlugin().setup()
			case .webSocket:
				WebSocketPlugin().setup()
			case .networkSecurity:
				NetworkSecurityPlugin().setup()
			case .appSecurity:
				AppSecurityPlugin().setup()
			}
		}
		
		return self
	}
}

// MARK: - ================================= Usage =================================
extension ExternalPluginsBuilder {
	func finish() -> Result {
		return (error == nil, error)
	}
}
