//
//  UseCasesProtocol.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 02/04/2022.
//

import Foundation



protocol UseCasesProtocol {
	// GET
	func userInfo(inputUrl: UrlInputUserInfo) async throws -> UserEntity
	func userEmail(inputUrl: UrlInputUserInfo) async throws -> UserEmailEntity
	// POST
	func register(inputBody: BodyInputUserInfo) async throws -> Bool
	// PUT
	func update(inputUrl: UrlInputUserInfo, inputBody: BodyInputUserInfo) async throws -> Bool
}

// Use for network
protocol NetworkServiceProtocol: UseCasesProtocol {
}

// Use for local data
//protocol DataStoreServiceProtocol: UseCasesProtocol {
//}
