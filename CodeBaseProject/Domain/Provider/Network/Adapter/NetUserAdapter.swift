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
	func userInfo(inputUrl: UrlInputUserInfo) async -> FinalResult<UserEntity> {
		return await network.userInfo(inputUrl: inputUrl)
	}
	
	func userEmail(inputUrl: UrlInputUserInfo) async -> FinalResult<UserEmailEntity> {
		return await network.userEmail(inputUrl: inputUrl)
	}
	
	// POST
	func register(inputBody: BodyInputUserInfo) async -> FinalResult<Bool> {
		return await network.register(inputBody: inputBody)
	}
	
	// PUT
	func update(inputUrl: UrlInputUserInfo, inputBody: BodyInputUserInfo) async -> FinalResult<Bool> {
		return await network.update(inputUrl: inputUrl, inputBody: inputBody)
	}
}

