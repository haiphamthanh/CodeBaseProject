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
	func userInfo(inputUrl: UrlInputUserInfo) async -> DataResult<UserData>
	func userEmail(inputUrl: UrlInputUserInfo) async -> DataResult<UserData>
	// POST
	func register(inputBody: BodyInputUserInfo) async -> DataResult<Bool>
	// PUT
	func update(inputUrl: UrlInputUserInfo, inputBody: BodyInputUserInfo) async -> DataResult<Bool>
}
