//
//  UseCaseConstructor.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 02/04/2022.
//

import Foundation

class UseCaseConstructor: UseCasesProtocol {
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

class NetworkService: UseCaseConstructor {
}

private class DemoPreview {
	func execute() async throws {
		let networkProvider = NetProvider()
		let useCaseProvider = NetUseCaseProvider(networkProvider)
		let networkService = NetworkService(useCaseProvider: useCaseProvider)
		
		//		do {
		//
		//			defer {
		//				print("do complete..")
		//			}
		//
		//			let result = try await networkService.userInfo(inputUrl: UrlInputUserInfo(userId: "123", gender: nil))
		//			print(result)
		//
		//		} catch is ErrorPointer { //generic error
		//			print("error")
		//		} catch { // else
		//			print("error")
		//		}
		
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
