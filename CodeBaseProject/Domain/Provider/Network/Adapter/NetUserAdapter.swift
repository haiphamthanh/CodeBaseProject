//
//  NetUserAdapter.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 02/04/2022.
//

///
/// Adapt Network to Usecase
///
import Foundation

final class NetUserAdapter: UserUseCase {
	private let network: UserNetworkProtocol
	
	init(network: UserNetworkProtocol) {
		self.network = network
	}
	
	// GET
	func userInfo(inputUrl: UrlInputUserInfo) async throws -> UserEntity {
		return try await network.userInfo(inputUrl: inputUrl)
	}
	
	func userEmail(inputUrl: UrlInputUserInfo) async throws -> UserEmailEntity {
		return try await network.userEmail(inputUrl: inputUrl)
	}
	
	// POST
	func register(inputBody: BodyInputUserInfo) async throws -> Bool {
		return try await network.register(inputBody: inputBody)
	}
	
	// PUT
	func update(inputUrl: UrlInputUserInfo, inputBody: BodyInputUserInfo) async throws -> Bool {
		return try await network.update(inputUrl: inputUrl, inputBody: inputBody)
	}
}

