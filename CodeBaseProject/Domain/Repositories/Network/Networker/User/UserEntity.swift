//
//  UserEntity.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 02/04/2022.
//

import Foundation

// MARK: - ================================= Entity =================================
public struct UserEntity: Codable {
	public var id: Int
	public var actived: Bool
	public var name: String?
	public var hireable: Bool?
	public var location: String?
	public var bio: String?
}

public struct UserEmailEntity: Codable {
	public var email: String
	public var verified: Bool
	public var primary: Bool
	public var visibility: String?
}
