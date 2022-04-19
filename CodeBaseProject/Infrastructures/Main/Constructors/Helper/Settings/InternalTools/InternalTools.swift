//
//  InternalTools.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 09/04/2022.
//

import Swinject

class InternalToolsBuilder {
	typealias T = (success: Bool, error: Error?)
	private var error: Error?
	
	private init() {
		//fatalError("This type cannot be constructed directly, use static var 'builder' instead.")
	}
	
	static var builder: InternalToolsBuilder {
		return InternalToolsBuilder()
	}
}

extension InternalToolsBuilder {
	func registerUIToolsHelper(to container: Container) -> Self {
		UIToolsRegister(container: container).start()
		return self
	}
	
	func registerUI(to container: Container) -> Self {
		UIRegister(container: container).start()
		return self
	}
}

// MARK: - ================================= Usage =================================
extension InternalToolsBuilder {
	func finish() -> T {
		return (error != nil, error)
	}
}
