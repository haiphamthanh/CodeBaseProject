//
//  URLRequestEx.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 22/03/2022.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2021-2022 Alexander Grebenyuk (github.com/kean).

import Foundation

extension URLRequest {
	public func cURLDescription() -> String {
		guard let url = url, let method = httpMethod else {
			return "$ curl command generation failed"
		}
		var components = ["curl -v"]
		components.append("-X \(method)")
		for header in allHTTPHeaderFields ?? [:] {
			let escapedValue = header.value.replacingOccurrences(of: "\"", with: "\\\"")
			components.append("-H \"\(header.key): \(escapedValue)\"")
		}
		if let httpBodyData = httpBody {
			let httpBody = String(decoding: httpBodyData, as: UTF8.self)
			var escapedBody = httpBody.replacingOccurrences(of: "\\\"", with: "\\\\\"")
			escapedBody = escapedBody.replacingOccurrences(of: "\"", with: "\\\"")
			components.append("-d \"\(escapedBody)\"")
		}
		components.append("\"\(url.absoluteString)\"")
		return components.joined(separator: " \\\n\t")
	}
}

extension URLRequest {
	/// Returns the `httpMethod` as Alamofire's `HTTPMethod` type.
	public var method: HTTPMethod? {
		get { httpMethod.flatMap(HTTPMethod.init) }
		set { httpMethod = newValue?.rawValue }
	}

	public func validate() throws {
		if method == .get, let bodyData = httpBody {
			throw AFError.urlRequestValidationFailed(reason: .bodyDataInGETRequest(bodyData))
		}
	}
}
