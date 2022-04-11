//
//  NetworkProviderImpl.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 10/04/2022.
//

import Foundation

class NetworkProviderImpl: NetworkProvider {
	var user: UserNetwork {
		return UserNetworkImpl()
	}
}
