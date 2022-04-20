//
//  AppRegister.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 09/04/2022.
//

import Swinject

class AppRegister {
	typealias Result = (success: Bool, error: Error?)
	private var error: Error?
	
	private init() {
		//fatalError("This type cannot be constructed directly, use static var 'builder' instead.")
	}
	
	static var builder: AppRegister {
		return AppRegister()
	}
}

extension AppRegister {
	func registerSystemTools(to container: Container) -> Self {
		SystemRegister(container).start()
		return self
	}
	
	func registerUIToolsHelper(to container: Container) -> Self {
		UIToolsRegister(container).start()
		return self
	}
	
	func registerStory(to container: Container) -> Self {
		StoryRegister(container).start()
		return self
	}
	
	func registerUI(to container: Container) -> Self {
		UIRegister(container).start()
		return self
	}
	
	func registerDomain(to container: Container) -> Self {
		DomainRegister(container).start()
		return self
	}
}

// MARK: - ================================= Usage =================================
extension AppRegister {
	func finish() -> Result {
		return (error == nil, error)
	}
}
