//
//  Endpoint.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 24/03/2022.
//

import Foundation

protocol Endpoint {
	/// The target's host
	var host: String { get }
	
	/// The path to be appended to `host` to form the full `URL`.
	var path: String { get }
	
	/// The HTTP method used in the request.
	var method: HTTPMethod { get }
	
	/// Provides stub data for use in testing. Default is `Data()`.
	var sampleData: Data { get }
	
	/// The type of HTTP task to be performed.
	var task: TaskA { get }
	
	/// The type of validation to perform on the request. Default is `.none`.
	var validationType: ValidationType { get }
	
	/// The headers to be used in the request.
	var headers: [String: String]? { get }
}


extension Endpoint {

	/// The type of validation to perform on the request. Default is `.none`.
	var validationType: ValidationType { .none }

	/// Provides stub data for use in testing. Default is `Data()`.
	var sampleData: Data { Data() }
}
