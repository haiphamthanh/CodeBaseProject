//
//  ExternalTools.swift
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

class ExternalToolsBuilder {
	typealias T = (success: Bool, error: Error?)
	private var error: Error?
	
	init() {
		fatalError("This type cannot be constructed directly, use static var 'builder' instead.")
	}
	
	static var builder: ExternalToolsBuilder {
		return ExternalToolsBuilder()
	}
}

extension ExternalToolsBuilder {
	func useExternalService(_ service: ExternalServices) -> Self {
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
extension ExternalToolsBuilder {
	func finish() -> T {
		return (error != nil, error)
	}
}