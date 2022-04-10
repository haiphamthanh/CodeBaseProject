//
//  RepoProviderImpl.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 10/04/2022.
//

import Foundation

class RepoProviderImpl: RepoProvider {
	private let networkProvider: NetworkProvider
	private let localProvider: LocalProvider
	
	init(_ networkProvider: NetworkProvider, _ localProvider: LocalProvider) {
		self.networkProvider = networkProvider
		self.localProvider = localProvider
	}
	
	var userRepo: UserRepository {
		return UserRepositoryImpl(userNetwork: networkProvider.user,
								  userLocal: localProvider.user)
	}
}
