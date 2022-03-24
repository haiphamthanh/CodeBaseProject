//
//  Response.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 21/03/2022.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2021-2022 Alexander Grebenyuk (github.com/kean).

import Foundation

/// A response with a value and associated metadata.
public struct Response<T> {
	public var value: T
	/// Original response data.
	public var data: Data
	/// Original request.
	public var urlRequest: URLRequest
	public var urlResponse: URLResponse
	public var statusCode: Int? { (urlResponse as? HTTPURLResponse)?.statusCode }
	public var metrics: URLSessionTaskMetrics?
	
	public init(value: T, data: Data, urlRequest: URLRequest, urlResponse: URLResponse, metrics: URLSessionTaskMetrics? = nil) {
		self.value = value
		self.data = data
		self.urlRequest = urlRequest
		self.urlResponse = urlResponse
		self.metrics = metrics
	}
}

// MARK: - ================================= Usage =================================
extension Response {
	func map<U>(_ closure: (T) -> U) -> Response<U> {
		Response<U>(value: closure(value),
					data: data,
					urlRequest: urlRequest,
					urlResponse: urlResponse,
					metrics: metrics)
	}
}
