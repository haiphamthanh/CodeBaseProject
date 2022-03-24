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
