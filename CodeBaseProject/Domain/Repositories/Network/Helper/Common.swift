//
//  Common.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 22/03/2022.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2021-2022 Alexander Grebenyuk (github.com/kean).

import Foundation

struct AnyEncodable: Encodable {
	private let value: Encodable

	init(_ value: Encodable) {
		self.value = value
	}

	func encode(to encoder: Encoder) throws {
		try value.encode(to: encoder)
	}
}

/// Types adopting the `URLConvertible` protocol can be used to construct `URL`s, which can then be used to construct
/// `URLRequests`.
public protocol URLConvertible {
	/// Returns a `URL` from the conforming instance or throws.
	///
	/// - Returns: The `URL` created from the instance.
	/// - Throws:  Any error thrown while creating the `URL`.
	func asURL() throws -> URL
}

/// Generate log data
///
func errorConstructor(_ message: String, code: Int = 0, domain: String = "com.example.error", function: String = #function, file: String = #file, line: Int = #line) -> NSError {

	let functionKey = "\(domain).function"
	let fileKey = "\(domain).file"
	let lineKey = "\(domain).line"

	let error = NSError(domain: domain, code: code, userInfo: [
		NSLocalizedDescriptionKey: message,
		functionKey: function,
		fileKey: file,
		lineKey: line
	])

	// Crashlytics.sharedInstance().recordError(error)

	return error
}
