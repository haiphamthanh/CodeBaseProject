//
//  UseCasesImpl.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 03/04/2022.
//

class UseCasesImpl: UseCases {
	@Inject var user: UserUseCase
	
	deinit {
		print("\(self) deinit")
	}
}
