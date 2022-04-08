//
//  NetUseCaseProvider.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 02/04/2022.
//

import Foundation

final class NetUseCaseProvider: UseCaseProviderProtocol {
	private let netProvider: NetProviderProtocol
	
	init(_ netProvider: NetProviderProtocol) {
		self.netProvider = netProvider
	}
}

// MARK: - ================================= Allocate UseCase =================================
///
/// Connect the parts of network. 
///
extension NetUseCaseProvider {
	var user: UserUseCase {
		return NetUserAdapter(network: netProvider.userNetwork)
	}
}
