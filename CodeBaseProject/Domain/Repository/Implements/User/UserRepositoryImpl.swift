//
//  UserRepositoryImpl.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 10/04/2022.
//

import Foundation

class UserRepositoryImpl: UserRepository {
	var userNetwork: UserNetwork
	var userLocal: UserLocal // TODO: Hanlde to save data
	init(userNetwork: UserNetwork, userLocal: UserLocal) {
		self.userNetwork = userNetwork
		self.userLocal = userLocal
	}
	
	func userInfo(inputUrl: UrlInputUserInfo) async -> FinalResult<UserEntity> {
		return await userNetwork.userInfo(inputUrl: inputUrl)
	}
	
	func userEmail(inputUrl: UrlInputUserInfo) async -> FinalResult<UserEmailEntity> {
		return await userNetwork.userEmail(inputUrl: inputUrl)
	}
	
	func register(inputBody: BodyInputUserInfo) async -> FinalResult<Bool> {
		return await userNetwork.register(inputBody: inputBody)
	}
	
	func update(inputUrl: UrlInputUserInfo, inputBody: BodyInputUserInfo) async -> FinalResult<Bool> {
		return await userNetwork.update(inputUrl: inputUrl, inputBody: inputBody)
	}
}
