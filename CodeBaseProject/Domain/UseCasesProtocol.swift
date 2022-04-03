//
//  UseCasesProtocol.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 02/04/2022.
//

import Foundation



protocol UseCasesProtocol {
	// GET
	func userInfo(inputUrl: UrlInputUserInfo) async -> FinalResult<UserEntity>
	func userEmail(inputUrl: UrlInputUserInfo) async -> FinalResult<UserEmailEntity>
	// POST
	func register(inputBody: BodyInputUserInfo) async -> FinalResult<Bool>
	// PUT
	func update(inputUrl: UrlInputUserInfo, inputBody: BodyInputUserInfo) async -> FinalResult<Bool>
}

private class DemoPreview {
	func execute() async throws {
		let networkProvider = NetProvider()
		let useCaseProvider = NetUseCaseProvider(networkProvider)
		let networkService = NetworkService(usecaseProvider: useCaseProvider)
		
		let result = await networkService.userInfo(inputUrl: UrlInputUserInfo(userId: "123", gender: nil))
		switch result {
		case .success(let value):
			print(value)
			break
		case .failure(let error):
			print(error)
		}
	}
}
