//
//  NetworkService.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 03/04/2022.
//

import Foundation

// Use for network
protocol NetworkServiceProtocol: UseCasesProtocol {
}

class NetworkService {
	private let usecaseProvider: UseCaseProviderProtocol
	
	init(usecaseProvider: UseCaseProviderProtocol) {
		self.usecaseProvider = usecaseProvider
	}
}

extension NetworkService: NetworkServiceProtocol {
	var user: UserUseCase {
		usecaseProvider.user
	}
}
