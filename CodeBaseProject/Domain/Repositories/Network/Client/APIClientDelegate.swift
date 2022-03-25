//
//  APIClientDelegate.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 23/03/2022.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2021-2022 Alexander Grebenyuk (github.com/kean).

import Foundation

public protocol APIClientDelegate {
	func client(_ client: APIClient, willSendRequest request: inout URLRequest) async throws
	func shouldClientRetry(_ client: APIClient, withError error: Error) async throws -> Bool
	func client(_ client: APIClient, didReceiveInvalidResponse response: HTTPURLResponse, data: Data) -> Error
}

public extension APIClientDelegate {
	func client(_ client: APIClient, willSendRequest request: inout URLRequest) async throws {}
	func shouldClientRetry(_ client: APIClient, withError error: Error) async throws -> Bool { false }
	func client(_ client: APIClient, didReceiveInvalidResponse response: HTTPURLResponse, data: Data) -> Error {
		APIError.unacceptableStatusCode(response.statusCode)
	}
}
