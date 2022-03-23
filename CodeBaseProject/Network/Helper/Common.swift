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
