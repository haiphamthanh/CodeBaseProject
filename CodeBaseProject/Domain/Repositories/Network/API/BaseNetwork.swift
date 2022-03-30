//
//  BaseNetwork.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 25/03/2022.
//

import Foundation

protocol Builder {
	associatedtype T: Encodable
	func build() -> T
}

class BaseNetwork {
	private let id = Date().nanosecond
	
	final func exec<E: Endpoint, O: Decodable>(_ endpoint: E) async throws -> O {
		let host = endpoint.host
		return try await networking(host: host).request(id: id, endpoint)
	}
	
	private func networking<E, O>(host: String) -> Networking<E, O> {
		return Networking<E, O>(host: host)
	}
}
