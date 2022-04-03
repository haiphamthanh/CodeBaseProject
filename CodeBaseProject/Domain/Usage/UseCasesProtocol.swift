//
//  UseCasesProtocol.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 02/04/2022.
//

import Foundation

typealias DataResult<O> = Result<O, Error>
protocol UseCasesProtocol {
	var user: UserUseCase { get }
}

private class DemoPreview {
	func execute() async throws {
		let networkProvider = NetProvider()
		let useCaseProvider = NetUseCaseProvider(networkProvider)
		let networkService = NetworkService(usecaseProvider: useCaseProvider)
		
		let result = await networkService.user.userInfo(inputUrl: UrlInputUserInfo(userId: "123", gender: nil))
		switch result {
		case .success(let value):
			print(value)
			break
		case .failure(let error):
			print(error)
		}
	}
}
