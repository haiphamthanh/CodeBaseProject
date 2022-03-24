//
//  OnlineProvider.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 24/03/2022.
//

import Foundation

// MARK: ================================= Provider constructor =================================
class OnlineProvider<Target, O> where Target: Endpoint, O: Decodable {
	fileprivate let online: Bool //fileprivate let online: Observable<Bool>
	fileprivate let apiClient: APIClient
	fileprivate lazy var requestFactory = RequestFactory<Target, O>()
	
	init(host: String, plugins: [PluginType] = [], online: Bool = false) {
		self.online = online
		self.apiClient = APIClient(host: host)
	}
}

// MARK: - ================================= Usage =================================
extension OnlineProvider {
	func request(_ target: Target) async throws -> Response<O> {
		let request = requestFactory.request(for: target)
		return try await apiClient.response(from: request)
	}
}
