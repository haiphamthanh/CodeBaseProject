//
//  Serializer.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 22/03/2022.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2021-2022 Alexander Grebenyuk (github.com/kean).

import Foundation

protocol SerializerP {
	func decode<T: Decodable>(_ data: Data) async throws -> T
	func encode<T: Encodable>(_ entity: T) async throws -> Data
}

actor Serializer {
	private let decoder: JSONDecoder
	private let encoder: JSONEncoder
	
	init(decoder: JSONDecoder?, encoder: JSONEncoder?) {
		if let decoder = decoder {
			self.decoder = decoder
		} else {
			self.decoder = JSONDecoder()
			self.decoder.dateDecodingStrategy = .iso8601
		}
		
		if let encoder = encoder {
			self.encoder = encoder
		} else {
			self.encoder = JSONEncoder()
			self.encoder.dateEncodingStrategy = .iso8601
		}
	}
}

// MARK: - ================================= Usage =================================
extension Serializer: SerializerP {
	func decode<T: Decodable>(_ data: Data) async throws -> T {
		try decoder.decode(T.self, from: data)
	}
	
	func encode<T: Encodable>(_ entity: T) async throws -> Data {
		try encoder.encode(entity)
	}
}
