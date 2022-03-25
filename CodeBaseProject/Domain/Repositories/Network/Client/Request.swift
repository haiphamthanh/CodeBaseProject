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

public struct HTTPMethod: RawRepresentable, Equatable, Hashable {
	/// `CONNECT` method.
	public static let connect = HTTPMethod(rawValue: "CONNECT")
	/// `DELETE` method.
	public static let delete = HTTPMethod(rawValue: "DELETE")
	/// `GET` method.
	public static let get = HTTPMethod(rawValue: "GET")
	/// `HEAD` method.
	public static let head = HTTPMethod(rawValue: "HEAD")
	/// `OPTIONS` method.
	public static let options = HTTPMethod(rawValue: "OPTIONS")
	/// `PATCH` method.
	public static let patch = HTTPMethod(rawValue: "PATCH")
	/// `POST` method.
	public static let post = HTTPMethod(rawValue: "POST")
	/// `PUT` method.
	public static let put = HTTPMethod(rawValue: "PUT")
	/// `TRACE` method.
	public static let trace = HTTPMethod(rawValue: "TRACE")

	public let rawValue: String

	public init(rawValue: String) {
		self.rawValue = rawValue
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

public struct Request<Response> {
	public var method: HTTPMethod
	public var path: String
	public var queryParams: [(String, String?)]?
	var body: AnyEncodable?
	public var headers: [String: String]?
	public var id: String?
	
	public init(method: HTTPMethod, path: String, queryParams: [(String, String?)]? = nil, headers: [String : String]? = nil) {
		self.method = method
		self.path = path
		self.queryParams = queryParams
		self.headers = headers
	}
	
	public init<U: Encodable>(method: HTTPMethod, path: String, queryParams: [(String, String?)]? = nil, body: U?, headers: [String : String]? = nil) {
		self.method = method
		self.path = path
		self.queryParams = queryParams
		self.body = body.map(AnyEncodable.init)
		self.headers = headers
	}
}

// MARK: - ================================= Usage =================================
extension Request {
	public static func get(_ path: String, queryParams: [(String, String?)]? = nil, headers: [String: String]? = nil) -> Request {
		Request(method: .get, path: path, queryParams: queryParams, headers: headers)
	}
	
	public static func post(_ path: String, queryParams: [(String, String?)]? = nil, headers: [String: String]? = nil) -> Request {
		Request(method: .post, path: path, queryParams: queryParams, headers: headers)
	}
	
	public static func post<U: Encodable>(_ path: String, queryParams: [(String, String?)]? = nil, body: U?, headers: [String: String]? = nil) -> Request {
		Request(method: .post, path: path, queryParams: queryParams, body: body, headers: headers)
	}
	
	public static func put(_ path: String, queryParams: [(String, String?)]? = nil, headers: [String: String]? = nil) -> Request {
		Request(method: .put, path: path, queryParams: queryParams, headers: headers)
	}
	
	public static func put<U: Encodable>(_ path: String, queryParams: [(String, String?)]? = nil, body: U?, headers: [String: String]? = nil) -> Request {
		Request(method: .put, path: path, queryParams: queryParams, body: body, headers: headers)
	}
	
	public static func patch(_ path: String, queryParams: [(String, String?)]? = nil, headers: [String: String]? = nil) -> Request {
		Request(method: .patch, path: path, queryParams: queryParams, headers: headers)
	}
	
	public static func patch<U: Encodable>(_ path: String, queryParams: [(String, String?)]? = nil, body: U?, headers: [String: String]? = nil) -> Request {
		Request(method: .patch, path: path, queryParams: queryParams, body: body, headers: headers)
	}
	
	public static func delete(_ path: String, queryParams: [(String, String?)]? = nil, headers: [String: String]? = nil) -> Request {
		Request(method: .delete, path: path, queryParams: queryParams, headers: headers)
	}
	
	public static func delete<U: Encodable>(_ path: String, queryParams: [(String, String?)]? = nil, body: U?, headers: [String: String]? = nil) -> Request {
		Request(method: .delete, path: path, queryParams: queryParams, body: body, headers: headers)
	}
	
	public static func options(_ path: String, queryParams: [(String, String?)]? = nil, headers: [String: String]? = nil) -> Request {
		Request(method: .options, path: path, queryParams: queryParams, headers: headers)
	}
	
	public static func head(_ path: String, queryParams: [(String, String?)]? = nil, headers: [String: String]? = nil) -> Request {
		Request(method: .head, path: path, queryParams: queryParams, headers: headers)
	}
	
	public static func trace(_ path: String, queryParams: [(String, String?)]? = nil, headers: [String: String]? = nil) -> Request {
		Request(method: .trace, path: path, queryParams: queryParams, headers: headers)
	}
}
