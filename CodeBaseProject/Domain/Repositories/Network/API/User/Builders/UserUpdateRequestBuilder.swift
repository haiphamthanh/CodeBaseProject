//
//  UserUpdateRequestBuilder.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 02/04/2022.
//

import Foundation

struct UserUpdateRequestParams {
	struct Url: Encodable {
		enum `Gender`: Encodable {
			case male, female, other
		}
		
		fileprivate(set) var gender: Gender?
		fileprivate(set) var userId: String?
	}
	
	struct Body: Encodable {
		fileprivate(set) var username: String?
		fileprivate(set) var password: String?
	}
	
	fileprivate(set) var url: Url
	fileprivate(set) var body: Body
}

class UserUpdateRequestBuilder {
	typealias T = UserUpdateRequestParams
	fileprivate var requestParam: UserUpdateRequestParams!
	
	init() {
		fatalError("This type cannot be constructed directly, use static var 'builder' instead.")
	}
	
	private init(_ requestParam: UserUpdateRequestParams) {
		self.requestParam = requestParam
	}
	
	static var builder: UserUpdateRequestBuilder {
		let userUpdateParams = UserUpdateRequestParams(url: UserUpdateRequestParams.Url(),
													   body: UserUpdateRequestParams.Body())
		return UserUpdateRequestBuilder(userUpdateParams)
	}
}

// MARK: - ================================= Usage =================================
extension UserUpdateRequestBuilder: Builder {
	func build() -> T {
		return requestParam
	}
}

// MARK: - ================================= UserUpdateUrlRequestParams =================================
extension UserUpdateRequestBuilder {
	func url_userId(_ userId: String) -> Self {
		requestParam.url.userId = userId
		return self
	}
	
	func url_gender(_ gender: UserUpdateRequestParams.Url.Gender?) -> Self {
		requestParam.url.gender = gender
		return self
	}
}

// MARK: - ================================= UserUpdateBodyRequestParams =================================
extension UserUpdateRequestBuilder {
	func body_username(_ username: String?) -> Self {
		requestParam.body.username = username
		return self
	}
	
	func body_password(_ password: String?) -> Self {
		requestParam.body.password = password
		return self
	}
}

private class DemoPreview {
	func execute() {
		let requestParams = UserUpdateRequestBuilder.builder
			.url_gender(.female)
			.url_userId("123")
			.body_username("hai")
			.body_password("v0danh9086076")
			.build()
		print(requestParams)
	
	}
}

