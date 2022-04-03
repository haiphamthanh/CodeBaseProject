//
//  UserUseCase.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 25/03/2022.
//

import Foundation
/**
Provide methods using for User action
*/
protocol UserUseCase {
	// GET
	func userInfo(inputUrl: UrlInputUserInfo) async -> FinalResult<UserEntity>
	func userEmail(inputUrl: UrlInputUserInfo) async -> FinalResult<UserEmailEntity>
	// POST
	func register(inputBody: BodyInputUserInfo) async -> FinalResult<Bool>
	// PUT
	func update(inputUrl: UrlInputUserInfo, inputBody: BodyInputUserInfo) async -> FinalResult<Bool>
}
