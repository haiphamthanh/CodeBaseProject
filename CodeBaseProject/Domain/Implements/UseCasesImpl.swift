//
//  UseCasesImpl.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 03/04/2022.
//

import Foundation

class UseCasesImpl {
	private let usecaseProvider: UseCaseProvider
	
	init(usecaseProvider: UseCaseProvider) {
		self.usecaseProvider = usecaseProvider
	}
}

extension UseCasesImpl: UseCases {
	var user: UserUseCase {
		usecaseProvider.user
	}
}

