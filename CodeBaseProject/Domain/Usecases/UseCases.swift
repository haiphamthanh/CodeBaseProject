//
//  UseCases.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 02/04/2022.
//

import Foundation

typealias DataResult<O> = Result<O, Error>
protocol UseCases {
	var user: UserUseCase { get }
}

private class DemoPreview {
	func execute() async throws {
		// Use DI instead
		let usecase = UseCasesImpl()
		
		let result = await usecase.user.userInfo(inputUrl: UrlInputUserInfo(userId: "123", gender: nil))
		switch result {
		case .success(let value):
			print(value)
			break
		case .failure(let error):
			print(error)
		}
	}
}
