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

// Use for network
protocol NetworkServiceProtocol: UseCasesProtocol {
}

// Use for local data
//protocol DataStoreServiceProtocol: UseCasesProtocol {
//}
