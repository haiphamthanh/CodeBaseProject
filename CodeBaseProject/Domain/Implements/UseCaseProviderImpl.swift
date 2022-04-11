//
//  UseCaseProviderImpl.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 02/04/2022.
//

import Foundation

final class UseCaseProviderImpl: UseCaseProvider {
	private let repoProvider: RepoProvider
	
	init(_ repoProvider: RepoProvider) {
		self.repoProvider = repoProvider
	}
}

// MARK: - ================================= Allocate UseCase =================================
///
/// Connect the parts of network. 
///
extension UseCaseProviderImpl {
	var user: UserUseCase {
		return UserAdapter(userRepo: repoProvider.userRepo)
	}
}
