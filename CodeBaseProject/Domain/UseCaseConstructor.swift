//
//  UseCaseConstructor.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 02/04/2022.
//

import SwiftUI

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
	func userInfo(inputUrl: UrlInputUserInfo) async throws -> UserEntity {
		return try await useCaseProvider.user.userInfo(inputUrl: inputUrl)
	}
	
	func userEmail(inputUrl: UrlInputUserInfo) async throws -> UserEmailEntity {
		return try await useCaseProvider.user.userEmail(inputUrl: inputUrl)
	}
	
	// Register
	func register(inputBody: BodyInputUserInfo) async throws -> Bool {
		return try await useCaseProvider.user.register(inputBody: inputBody)
	}
	
	// Update
	func update(inputUrl: UrlInputUserInfo, inputBody: BodyInputUserInfo) async throws -> Bool {
		return try await useCaseProvider.user.update(inputUrl: inputUrl, inputBody: inputBody)
	}
}

class NetworkService: UseCaseConstructor {
}

private class DemoPreview {
	func execute() async throws {
		let networkProvider = NetProvider()
		let useCaseProvider = NetUseCaseProvider(networkProvider)
		let networkService = NetworkService(useCaseProvider: useCaseProvider)
		
		do {
			
			defer {
				print("do complete..")
			}
			
			let result = try await networkService.userInfo(inputUrl: UrlInputUserInfo(userId: "123", gender: nil))
			print(result)
			
		} catch is ErrorPointer { //generic error
			print("error")
		} catch { // else
			print("error")
		}
	}
}
