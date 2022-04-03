//
//  UseCaseConstructor.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 02/04/2022.
//

import Foundation

class UseCaseConstructor {
	private var useCaseProvider: UseCaseProviderProtocol
	
	// MARK: - ================================= Init =================================
	init(useCaseProvider: UseCaseProviderProtocol) {
		self.useCaseProvider = useCaseProvider
	}
}

// MARK: - ================================= User =================================
extension UseCaseConstructor {
	// Info
	func userInfo(inputUrl: UrlInputUserInfo) async -> FinalResult<UserEntity> {
		return await useCaseProvider.user.userInfo(inputUrl: inputUrl)
	}
	
	func userEmail(inputUrl: UrlInputUserInfo) async -> FinalResult<UserEmailEntity> {
		return await useCaseProvider.user.userEmail(inputUrl: inputUrl)
	}
	
	// Register
	func register(inputBody: BodyInputUserInfo) async -> FinalResult<Bool> {
		return await useCaseProvider.user.register(inputBody: inputBody)
	}
	
	// Update
	func update(inputUrl: UrlInputUserInfo, inputBody: BodyInputUserInfo) async -> FinalResult<Bool> {
		return await useCaseProvider.user.update(inputUrl: inputUrl, inputBody: inputBody)
	}
}
