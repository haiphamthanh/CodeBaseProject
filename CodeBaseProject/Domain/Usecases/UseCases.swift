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
		let networkProvider = NetworkProviderImpl()
		let localProvider = LocalProviderImpl()
		let repoProvider = RepoProviderImpl(networkProvider, localProvider)
		let useCaseProvider = UseCaseProviderImpl(repoProvider)
		let usecase = UseCasesImpl(usecaseProvider: useCaseProvider)
		
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
