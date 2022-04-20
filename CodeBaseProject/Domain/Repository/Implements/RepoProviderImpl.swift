//
//  RepoProviderImpl.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 10/04/2022.
//

import Foundation

class RepoProviderImpl: RepoProvider {
	@Inject private var networkProvider: NetworkProvider
	@Inject private var localProvider: LocalProvider
	
	deinit {
		print("\(self) deinit")
	}
	
	var userRepo: UserRepository {
		return UserRepositoryImpl(userNetwork: networkProvider.user,
								  userLocal: localProvider.user)
	}
}
