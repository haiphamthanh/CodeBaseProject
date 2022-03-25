//
//  UserNetwork.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 24/03/2022.
//

import Foundation

// MARK: - ================================= Entity =================================
public struct User: Codable {
	public var id: Int
	public var login: String
	public var name: String?
	public var hireable: Bool?
	public var location: String?
	public var bio: String?
}

public struct UserEmail: Decodable {
	public var email: String
	public var verified: Bool
	public var primary: Bool
	public var visibility: String?
}

// MARK: - ================================= Params =================================
// Input
typealias InNWUserInfo = (Void)
typealias InNWUserRegister = (username: String, password: String)

// MARK: - ================================= API Implement =================================
final class UserNetwork: BaseNetwork {
//	private lazy var networking = Networking<UserAPI, User>()
//	private lazy var networkingVoid = Networking<UserAPI, VoidEntry>()
	
	// GET
	func userInfo(input: InNWUserInfo) async throws -> User {
		let api: UserAPI = .userInfo
		return try await exec(api)
	}
	
	func userEmail(input: InNWUserInfo) async throws -> UserEmail {
		let api: UserAPI = .userMail
		return try await exec(api)
	}
	
	// POST
	func register(input: InNWUserRegister) async throws -> Bool {
		let api: UserAPI = .register(username: input.username, password: input.password)
		return try await exec(api)
	}
	
//	private func transformToData(_ user: UserEntry) -> UserData {
//		let userData = user.asData()
//		return didSignIn(user: userData)
//	}
}
