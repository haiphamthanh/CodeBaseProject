//
//  UserAdapter.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 02/04/2022.
//

///
/// Adapt Repository to Usecase
///
import Foundation

final class UserAdapter: UserUseCase {
	@Inject private var userRepo: UserRepository
	
	// GET
	func userInfo(inputUrl: UrlInputUserInfo) async -> DataResult<UserData> {
		let infoResult =  await userRepo.userInfo(inputUrl: inputUrl)
		return userData(from: infoResult, email: nil)
	}
	
	func userEmail(inputUrl: UrlInputUserInfo) async -> DataResult<UserData> {
		let emailResult =  await userRepo.userEmail(inputUrl: inputUrl)
		return userData(from: nil, email: emailResult)
	}
	
	// POST
	func register(inputBody: BodyInputUserInfo) async -> DataResult<Bool> {
		return await userRepo.register(inputBody: inputBody)
	}
	
	// PUT
	func update(inputUrl: UrlInputUserInfo, inputBody: BodyInputUserInfo) async -> DataResult<Bool> {
		return await userRepo.update(inputUrl: inputUrl, inputBody: inputBody)
	}
}

// MARK: Translation supporting
private extension UserAdapter {
	func userData(from userInfo: FinalResult<UserEntity>?,
				  email: FinalResult<UserEmailEntity>?) -> DataResult<UserData> {
		switch (userInfo, email) {
		case (.success(let userEntity), .success(let emailEntity)):
			return .success(UserData(user: userEntity, mail: emailEntity))
		case (.success(let userEntity), .none):
			return .success(UserData(user: userEntity, mail: nil))
		case (.none, .success(let emailEntity)):
			return .success(UserData(user: nil, mail: emailEntity))
		case (.none, .none):
			return .success(UserData(user: nil, mail: nil))
		case (.failure(let userInfoError), _):
			return .failure(userInfoError )
		case (_, .failure(let emailError)):
			return .failure(emailError )
		}
	}
}
