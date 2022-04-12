//
//  InternalTools.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 09/04/2022.
//

import Swinject

enum InternalTools {
	case container(Container)
	case window(UIWindow, Container)
}

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
	func setupInternalTool(_ tool: InternalTools) -> Self {
		switch tool {
		case .container(let container):
			SwinjectSetting(container: container).startSettingUp()
		case .window(let window, let container):
			SwinjectScreenSetting(window: window, container: container).startSettingUp()
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
