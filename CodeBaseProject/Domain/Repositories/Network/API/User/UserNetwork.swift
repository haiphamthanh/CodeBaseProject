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


// MARK: - ================================= Sample =================================
//struct OfflineAction {
//	
//	enum `Type` {
//		case cache, get, delete
//	}
//	
//	fileprivate(set) var type: Type?
//	fileprivate(set) var data: Data?
//	fileprivate(set) var id: String?
//	fileprivate(set) var encryptionKey: String?
//	fileprivate(set) var keepAliveUntil: Date?
//	fileprivate(set) var ifBefore: Date?
//}
//
//protocol BuildStep {
//	func build() -> OfflineAction
//}
//
//protocol DataStep {
//	func data(_ data: Data) -> CacheCommonsStep
//}
//
//protocol CommonsStep: BuildStep {
//	func forId(_ id: String) -> Self
//	func withEncryptionKey(_ encryptionKey: String) -> Self
//}
//
//protocol CacheCommonsStep: CommonsStep {
//	func keepingAliveUntil(_ date: Date) -> Self
//}
//
//protocol GetCommonsStep: CommonsStep {
//	func ifBefore(_ date: Date) -> Self
//}
//
//class OfflineActionBuilder {
//	
//	fileprivate var action: OfflineAction!
//	
//	init() {
//		fatalError("This type cannot be constructed directly, use static var 'builder' instead.")
//	}
//	
//	private init(_ action: OfflineAction) {
//		self.action = action
//	}
//	
//	static var builder: RequestStep {
//		return OfflineActionBuilder(OfflineAction()) as RequestStep
//	}
//}
//
////extension OfflineActionBuilder: RequestStep, DataStep, CommonsStep, CacheCommonsStep, GetCommonsStep {
////	// Implementations of each protocol above.
////}
//
//
//extension OfflineActionBuilder: DataStep, CommonsStep, CacheCommonsStep, GetCommonsStep {
//	
//	func data(_ data: Data) -> CacheCommonsStep {
//		action.data = data
//		return self as CacheCommonsStep
//	}
//
//	func forId(_ id: String) -> Self {
//		action.id = id
//		return self
//	}
//
//	func withEncryptionKey(_ encryptionKey: String) -> Self {
//		action.encryptionKey = encryptionKey
//		return self
//	}
//
//	func keepingAliveUntil(_ date: Date) -> Self {
//		action.keepAliveUntil = date
//		return self
//	}
//
//	func ifBefore(_ date: Date) -> Self {
//		action.ifBefore = date
//		return self
//	}
//
//	func build() -> OfflineAction {
//		return action
//	}
//}
//
//let cache = OfflineActionBuilder.builder
//	.toCache("https://www.medium.com")
//	.data(Data())
//	.forId("id")
//	.keepingAliveUntil(Date())
//	.build()
