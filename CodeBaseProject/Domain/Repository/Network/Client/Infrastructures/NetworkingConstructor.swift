//
//  NetworkingConstructor.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 24/03/2022.
//

import Foundation

// TODO: Update later
enum NetworkingQueue {
	case concurrent
	case serial
}

// MARK: - ================================= Usage network constructor =================================
class NetworkingConstructor<E, O> where E: Endpoint, O: Decodable {
	fileprivate let provider: OnlineProvider<E, O>
	fileprivate let id: Int
	
	init(id: Int, provider: OnlineProvider<E, O>, queue: NetworkingQueue = .concurrent) {
		self.id = id
		self.provider = provider
	}
	
	// Use this to call for get response object
	func request(_ api: E) async throws -> O {
		try await startRequest(api).value
	}
}

private extension NetworkingConstructor {
	func startRequest(_ api: E) async throws -> Response<O> {
		try await provider.request(api)
	}
}
