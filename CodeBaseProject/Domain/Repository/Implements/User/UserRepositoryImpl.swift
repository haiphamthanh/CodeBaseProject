//
//  UserRepositoryImpl.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 10/04/2022.
//

import Foundation

class UserRepositoryImpl: UserRepository {
	@Inject private var network: UserNetwork
	@Inject private var local: UserLocal // TODO: Hanlde to save data
	
	func userInfo(inputUrl: UrlInputUserInfo) async -> FinalResult<UserEntity> {
		return await network.userInfo(inputUrl: inputUrl)
	}
	
	func userEmail(inputUrl: UrlInputUserInfo) async -> FinalResult<UserEmailEntity> {
		return await network.userEmail(inputUrl: inputUrl)
	}
	
	func register(inputBody: BodyInputUserInfo) async -> FinalResult<Bool> {
		return await network.register(inputBody: inputBody)
	}
	
	func update(inputUrl: UrlInputUserInfo, inputBody: BodyInputUserInfo) async -> FinalResult<Bool> {
		return await network.update(inputUrl: inputUrl, inputBody: inputBody)
	}
}
