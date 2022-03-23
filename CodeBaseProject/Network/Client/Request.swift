//
//  Request.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 23/03/2022.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2021-2022 Alexander Grebenyuk (github.com/kean).

import Foundation

public enum Method: String {
	case get = "GET"
	case post = "POST"
	case put = "PUT"
	case patch = "PATCH"
	case delete = "DELETE"
	case options = "OPTIONS"
	case head = "HEAD"
	case trace = "TRACE"
}

public struct Request<Response> {
	public var method: Method
	public var path: String
	public var query: [(String, String?)]?
	var body: AnyEncodable?
	public var headers: [String: String]?
	public var id: String?
	
	public init(method: Method, path: String, query: [(String, String?)]? = nil, headers: [String : String]? = nil) {
		self.method = method
		self.path = path
		self.query = query
		self.headers = headers
	}
	
	public init<U: Encodable>(method: Method, path: String, query: [(String, String?)]? = nil, body: U?, headers: [String : String]? = nil) {
		self.method = method
		self.path = path
		self.query = query
		self.body = body.map(AnyEncodable.init)
		self.headers = headers
	}
}

// MARK: - ================================= Usage =================================
extension Request {
	public static func get(_ path: String, query: [(String, String?)]? = nil, headers: [String: String]? = nil) -> Request {
		Request(method: .get, path: path, query: query, headers: headers)
	}
	
	public static func post(_ path: String, query: [(String, String?)]? = nil, headers: [String: String]? = nil) -> Request {
		Request(method: .post, path: path, query: query, headers: headers)
	}
	
	public static func post<U: Encodable>(_ path: String, query: [(String, String?)]? = nil, body: U?, headers: [String: String]? = nil) -> Request {
		Request(method: .post, path: path, query: query, body: body, headers: headers)
	}
	
	public static func put(_ path: String, query: [(String, String?)]? = nil, headers: [String: String]? = nil) -> Request {
		Request(method: .put, path: path, query: query, headers: headers)
	}
	
	public static func put<U: Encodable>(_ path: String, query: [(String, String?)]? = nil, body: U?, headers: [String: String]? = nil) -> Request {
		Request(method: .put, path: path, query: query, body: body, headers: headers)
	}
	
	public static func patch(_ path: String, query: [(String, String?)]? = nil, headers: [String: String]? = nil) -> Request {
		Request(method: .patch, path: path, query: query, headers: headers)
	}
	
	public static func patch<U: Encodable>(_ path: String, query: [(String, String?)]? = nil, body: U?, headers: [String: String]? = nil) -> Request {
		Request(method: .patch, path: path, query: query, body: body, headers: headers)
	}
	
	public static func delete(_ path: String, query: [(String, String?)]? = nil, headers: [String: String]? = nil) -> Request {
		Request(method: .delete, path: path, query: query, headers: headers)
	}
	
	public static func delete<U: Encodable>(_ path: String, query: [(String, String?)]? = nil, body: U?, headers: [String: String]? = nil) -> Request {
		Request(method: .delete, path: path, query: query, body: body, headers: headers)
	}
	
	public static func options(_ path: String, query: [(String, String?)]? = nil, headers: [String: String]? = nil) -> Request {
		Request(method: .options, path: path, query: query, headers: headers)
	}
	
	public static func head(_ path: String, query: [(String, String?)]? = nil, headers: [String: String]? = nil) -> Request {
		Request(method: .head, path: path, query: query, headers: headers)
	}
	
	public static func trace(_ path: String, query: [(String, String?)]? = nil, headers: [String: String]? = nil) -> Request {
		Request(method: .trace, path: path, query: query, headers: headers)
	}
}
