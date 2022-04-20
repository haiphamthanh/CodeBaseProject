//
//  UseCasesImpl.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 03/04/2022.
//

import Foundation

class UseCasesImpl {
	@Inject private var usecaseProvider: UseCaseProvider
	
	deinit {
		print("\(self) deinit")
	}
}

extension UseCasesImpl: UseCases {
	var user: UserUseCase {
		usecaseProvider.user
	}
}

