//
//  NetProvider.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 02/04/2022.
//

import Foundation

/**
Provide network to request api
*/
protocol NetProviderProtocol {
	var userNetwork: UserNetworkProtocol { get }
}

final class NetProvider: NetProviderProtocol {
	var userNetwork: UserNetworkProtocol {
		//TODO: Allocate UserNetwork in a common file
		return UserNetwork.init()
	}
}

