//
//  NetworkService.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 03/04/2022.
//

import Foundation

// Use for network
protocol NetworkServiceProtocol: UseCasesProtocol {
}

class NetworkService {
	private let usecaseProvider: UseCaseProviderProtocol
	init(usecaseProvider: UseCaseProviderProtocol) {
		self.usecaseProvider = usecaseProvider
	}
	
	private func constructor() -> UseCaseConstructor {
		return UseCaseConstructor.init(useCaseProvider: usecaseProvider)
	}
}

extension NetworkService: NetworkServiceProtocol {
	// Info
	func userInfo(inputUrl: UrlInputUserInfo) async -> FinalResult<UserEntity> {
		return await constructor().userInfo(inputUrl: inputUrl)
	}
	
	func userEmail(inputUrl: UrlInputUserInfo) async -> FinalResult<UserEmailEntity> {
		return await constructor().userEmail(inputUrl: inputUrl)
	}
	
	// Register
	func register(inputBody: BodyInputUserInfo) async -> FinalResult<Bool> {
		return await constructor().register(inputBody: inputBody)
	}
	
	// Update
	func update(inputUrl: UrlInputUserInfo, inputBody: BodyInputUserInfo) async -> FinalResult<Bool> {
		return await constructor().update(inputUrl: inputUrl, inputBody: inputBody)
	}
}
