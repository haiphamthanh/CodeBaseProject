//
//  UserRequestBuilder.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 29/03/2022.
//

import Foundation

struct UserRequestParams: Encodable {
	enum `Gender`: Encodable {
		case male, female, other
	}
	
	fileprivate(set) var gender: Gender?
	fileprivate(set) var userId: String?
}

class UserRequestBuilder {
	typealias T = UserRequestParams
	fileprivate var requestParam: T!
	
	init() {
		fatalError("This type cannot be constructed directly, use static var 'builder' instead.")
	}
	
	private init(_ requestParam: T) {
		self.requestParam = requestParam
	}
	
	static var builder: UserRequestBuilder {
		return UserRequestBuilder(T())
	}
}

// MARK: - ================================= Usage =================================
extension UserRequestBuilder: Builder {
	func build() -> T {
		return requestParam
	}
}

// MARK: - ================================= Setters =================================
extension UserRequestBuilder {
	func userId(_ userId: String?) -> Self {
		guard let userId = userId else {
			return self
		}

		requestParam.userId = userId
		return self
	}
	
	func gender(_ gender: UserRequestParams.Gender?) -> Self {
		guard let gender = gender else {
			return self
		}

		requestParam.gender = gender
		return self
	}
}

private class DemoPreview {
	func execute() {
		let requestParams = UserRequestBuilder.builder
			.gender(.female)
			.userId("123")
			.build()
		print(requestParams)
	
	}
}
