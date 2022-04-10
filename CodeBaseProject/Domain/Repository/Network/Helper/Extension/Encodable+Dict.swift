//
//  Encodable+Dict.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 30/03/2022.
//
//  https://stackoverflow.com/questions/46327302/init-an-object-conforming-to-codable-with-a-dictionary-array/46327303#46327303

import Foundation

extension Encodable {
	var dictionary: [String: Any]? {
		guard let data = try? JSONEncoder().encode(self) else { return nil }
		return (try? JSONSerialization.jsonObject(with: data,
												  options: .allowFragments))
		.flatMap { $0 as? [String: Any] }
	}
	
	func asDictionary() throws -> [String: Any] {
		let data = try JSONEncoder().encode(self)
		guard let dictionary = try JSONSerialization.jsonObject(with: data,
																options: .allowFragments) as? [String: Any] else {
			throw NSError()
		}
		
		return dictionary
	}
}

extension URLComponents {
	mutating func setQueryItems(with parameters: [String: String]) {
		self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
	}
	
	mutating func setQueryOptionalItems(with parameters: [String: String?]) {
		self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value ?? "") }
	}
}
