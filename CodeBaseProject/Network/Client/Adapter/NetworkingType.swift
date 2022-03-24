//
//  NetworkingType.swift
//  ASEducation
//
//  Created by HaiPT15 on 10/31/18.
//  Copyright © 2018 Asahi. All rights reserved.
//

import Foundation
import SwiftUI

protocol NetworkingType {
	associatedtype E: Endpoint
	associatedtype O: Decodable
	var provider: OnlineProvider<E, O> { get }
}

// MARK: ================================= request =================================
//// "Public" interfaces
extension NetworkingType {
	// Use this to call for get single response object
	func request(id: Int, _ api: E) async throws -> O {
		try await constructor(id: id).request(api)
	}
	
	private func constructor(id: Int) -> NetworkingConstructor<E, O> {
		return NetworkingConstructor<E, O>.init(id: id, provider: provider)
	}
}

// MARK: - ================================= Network constructors =================================
final class Networking<E, O>: NetworkingType where E: Endpoint, O: Decodable {
	let provider: OnlineProvider<E, O>
	init(host: String) {
		self.provider = OnlineProvider(host: host)
		
		//		if environmentDetected() == .development {
		//			self.provider = newStubProvider()
		//		} else {
		//			self.provider = newProvider(NetworkingInfrastructor<T>.authenticatedPlugins,
		//										xAccessToken: xAccessToken)
		//		}
	}
}

// MARK: ================================= Provider defincation utils =================================
//func newProvider<T>(_ plugins: [PluginType], xAccessToken: String? = nil) -> OnlineProvider<T> where T: TargetType, T: APIType {
//	return OnlineProvider(endpointClosure: NetworkingInfrastructor<T>.endpointsClosure(xAccessToken),
//						  requestClosure: NetworkingInfrastructor<T>.endpointResolver(),
//						  stubClosure: NetworkingInfrastructor<T>.APIKeysBasedStubBehaviour,
//						  plugins: plugins)
//}
//
//func newStubProvider<T>() -> OnlineProvider<T> where T: TargetType, T: APIType {
//	return OnlineProvider(endpointClosure: NetworkingInfrastructor<T>.endpointsClosure(),
//						  requestClosure: NetworkingInfrastructor<T>.endpointResolver(),
//						  stubClosure: MoyaProvider.immediatelyStub,
//						  online: .just(true))
//}
