//
//  BaseNetwork.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 25/03/2022.
//

import Foundation

protocol Builder {
	associatedtype T: Any
	func build() -> T
}

typealias FinalResult<O: Decodable> = Result<O, Error>
class BaseNetwork {
	private let id = Date().nanosecond
	
	// Support for Result
	final func execResult<E: Endpoint, O: Decodable>(_ endpoint: E) async -> FinalResult<O> {
		let host = endpoint.host
		return await networking(host: host).request(id: id, endpoint)
	}
	
	// Try catch
	final func exec<E: Endpoint, O: Decodable>(_ endpoint: E) async throws -> O {
		let host = endpoint.host
		return try await networking(host: host).request(id: id, endpoint)
	}
	
	private func networking<E, O>(host: String) -> Networking<E, O> {
		return Networking<E, O>(host: host)
	}
}
