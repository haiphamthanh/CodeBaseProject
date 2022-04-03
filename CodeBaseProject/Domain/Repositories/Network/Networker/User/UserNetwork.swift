//
//  UserNetwork.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 24/03/2022.
//

import Foundation

// MARK: - ================================= Network Interface =================================
protocol UserNetworkProtocol {
	// GET
	func userInfo(inputUrl: UrlInputUserInfo) async -> FinalResult<UserEntity>
		func userEmail(inputUrl: UrlInputUserInfo) async -> FinalResult<UserEmailEntity>
	// POST
	func register(inputBody: BodyInputUserInfo) async -> FinalResult<Bool>
	// PUT
	func update(inputUrl: UrlInputUserInfo, inputBody: BodyInputUserInfo) async -> FinalResult<Bool>
}

// MARK: - ================================= API Implement =================================
final class UserNetwork: BaseNetwork, UserNetworkProtocol {
	func userInfo(inputUrl: UrlInputUserInfo) async -> FinalResult<UserEntity> {
		let requestParams = UserRequestBuilder.builder
			.gender(inputUrl.gender?.lowercased() == "male" ? .male : .female)
			.userId(inputUrl.userId)
			.build()
		
		let api: UserAPI = .userInfo(params: requestParams)
		return await execResult(api)
	}
	
	func userEmail(inputUrl: UrlInputUserInfo) async -> FinalResult<UserEmailEntity> {
		let api: UserAPI = .userMail
		return await execResult(api)
	}
	
	func register(inputBody: BodyInputUserInfo) async -> FinalResult<Bool> {
		guard let username = inputBody.username, let password = inputBody.password else {
			return .failure(DomainError.UserInputRequestParamReason.invalidData("username or password is nil"))
		}
		
		let requestParams = UserRegisterRequestBuilder.builder
			.username(username)
			.password(password)
			.build()
		
		let api: UserAPI = .register(params: requestParams)
		return await execResult(api)
	}
	
	func update(inputUrl: UrlInputUserInfo, inputBody: BodyInputUserInfo) async -> FinalResult<Bool> {
		guard let userId = inputUrl.userId else {
			return .failure(DomainError.UserInputRequestParamReason.invalidData("username or password is nil"))
		}
		
		let requestParams = UserUpdateRequestBuilder.builder
			.url_gender(inputUrl.gender?.lowercased() == "male" ? .male : .female)
			.url_userId(userId)
			.body_username(inputBody.username)
			.body_password(inputBody.password)
			.build()
		
		let api: UserAPI = .update(requestParams: requestParams.url, bodyParams: requestParams.body)
		return await execResult(api)
	}
}

extension UserNetwork {
	//	private func transformToData(_ user: UserEntry) -> UserData {
	//		let userData = user.asData()
	//		return didSignIn(user: userData)
	//	}
}


/*
// MARK: - ================================= Network Interface =================================
protocol UserNetworkProtocol {
	// GET
	func userInfo(inputUrl: UrlInputUserInfo) async throws -> UserEntity
	func userEmail(inputUrl: UrlInputUserInfo) async throws -> UserEmailEntity
	// POST
	func register(inputBody: BodyInputUserInfo) async throws -> Bool
	// PUT
	func update(inputUrl: UrlInputUserInfo, inputBody: BodyInputUserInfo) async throws -> Bool
}

// MARK: - ================================= API Implement =================================
final class UserNetwork: BaseNetwork, UserNetworkProtocol {
	func userInfo(inputUrl: UrlInputUserInfo) async throws -> UserEntity {
		let requestParams = UserRequestBuilder.builder
			.gender(inputUrl.gender?.lowercased() == "male" ? .male : .female)
			.userId(inputUrl.userId)
			.build()
		
		let api: UserAPI = .userInfo(params: requestParams)
		return try await exec(api)
	}
	
	func userEmail(inputUrl: UrlInputUserInfo) async throws -> UserEmailEntity {
		let api: UserAPI = .userMail
		return try await exec(api)
	}
	
	func register(inputBody: BodyInputUserInfo) async throws -> Bool {
		guard let username = inputBody.username, let password = inputBody.password else {
			return false
		}
		
		let requestParams = UserRegisterRequestBuilder.builder
			.username(username)
			.password(password)
			.build()
		
		let api: UserAPI = .register(params: requestParams)
		return try await exec(api)
	}
	
	func update(inputUrl: UrlInputUserInfo, inputBody: BodyInputUserInfo) async throws -> Bool {
		guard let userId = inputUrl.userId else {
			return false
		}
		
		let requestParams = UserUpdateRequestBuilder.builder
			.url_gender(inputUrl.gender?.lowercased() == "male" ? .male : .female)
			.url_userId(userId)
			.body_username(inputBody.username)
			.body_password(inputBody.password)
			.build()
		
		let api: UserAPI = .update(requestParams: requestParams.url, bodyParams: requestParams.body)
		return try await exec(api)
	}
}
*/
