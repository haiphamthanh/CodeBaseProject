//
//  UserRegisterRequestBuilder.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 30/03/2022.
//

import Foundation

struct UserRegisterRequestParams: Encodable {
	fileprivate(set) var username: String?
	fileprivate(set) var password: String?
}

class UserRegisterRequestBuilder {
	typealias T = UserRegisterRequestParams
	fileprivate var requestParam: T!
	
	init() {
		fatalError("This type cannot be constructed directly, use static var 'builder' instead.")
	}
	
	private init(_ requestParam: T) {
		self.requestParam = requestParam
	}
	
	static var builder: UserRegisterRequestBuilder {
		return UserRegisterRequestBuilder(T())
	}
}

// MARK: - ================================= Usage =================================
extension UserRegisterRequestBuilder: Builder {
	func build() -> T {
		return requestParam
	}
}

// MARK: - ================================= Setters =================================
extension UserRegisterRequestBuilder {
	func username(_ username: String) -> Self {
		requestParam.username = username
		return self
	}
	
	func password(_ password: String) -> Self {
		requestParam.password = password
		return self
	}
}

private class DemoPreview {
	func execute() {
		let requestParams = UserRegisterRequestBuilder.builder
			.username("hai")
			.password("v0danh9086076")
			.build()
		print(requestParams)
	
	}
}
