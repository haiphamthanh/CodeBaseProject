//
//  UserUseCase.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 25/03/2022.
//

import SwiftUI
/**
Provide methods using for User action
*/
protocol UserUseCase {
	// GET
	func userInfo(inputUrl: UrlInputUserInfo) async throws -> UserEntity
	func userEmail(inputUrl: UrlInputUserInfo) async throws -> UserEmailEntity
	// POST
	func register(inputBody: BodyInputUserInfo) async throws -> Bool
	// PUT
	func update(inputUrl: UrlInputUserInfo, inputBody: BodyInputUserInfo) async throws -> Bool
}
