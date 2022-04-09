//
//  InternalTools.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 09/04/2022.
//

import Swinject

enum InternalTools {
	case container(Container)
}

class InternalToolsBuilder {
	typealias T = (success: Bool, error: Error?)
	private var error: Error?
	
	init() {
		fatalError("This type cannot be constructed directly, use static var 'builder' instead.")
	}
	
	static var builder: InternalToolsBuilder {
		return InternalToolsBuilder()
	}
}

extension InternalToolsBuilder {
	func setupInternalTool(_ tool: InternalTools) -> Self {
		switch tool {
		case .container(let container):
			//TODO: Setting up for container
			break
		}
		
		return self
	}
}

// MARK: - ================================= Usage =================================
extension InternalToolsBuilder {
	func finish() -> T {
		return (error != nil, error)
	}
}
