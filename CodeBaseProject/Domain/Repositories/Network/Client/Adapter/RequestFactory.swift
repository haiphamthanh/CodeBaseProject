//
//  RequestFactory.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 25/03/2022.
//

import Foundation

class RequestFactory<Target, O> where Target: Endpoint, O: Decodable {
	func request(for target: Target) -> Request<O> {
		let queryParams = [(String, String?)]()
		
		switch target.method {
		case .get:
			return Request.get(target.path, queryParams: queryParams, headers: target.headers)
		default:
			return Request.get(target.path, queryParams: queryParams, headers: target.headers)
		}
	}
}


//public static func get(_ path: String, queryParams: [(String, String?)]? = nil, headers: [String: String]? = nil) -> Request {
//	   Request(method: .get, path: path, queryParams: queryParams, headers: headers)
//   }
//
//   public static func post(_ path: String, queryParams: [(String, String?)]? = nil, headers: [String: String]? = nil) -> Request {
//	   Request(method: .post, path: path, queryParams: queryParams, headers: headers)
//   }
//
//   public static func post<U: Encodable>(_ path: String, queryParams: [(String, String?)]? = nil, body: U?, headers: [String: String]? = nil) -> Request {
//	   Request(method: .post, path: path, queryParams: queryParams, body: body, headers: headers)
//   }
//
//   public static func put(_ path: String, queryParams: [(String, String?)]? = nil, headers: [String: String]? = nil) -> Request {
//	   Request(method: .put, path: path, queryParams: queryParams, headers: headers)
//   }
//
//   public static func put<U: Encodable>(_ path: String, queryParams: [(String, String?)]? = nil, body: U?, headers: [String: String]? = nil) -> Request {
//	   Request(method: .put, path: path, queryParams: queryParams, body: body, headers: headers)
//   }
//
//   public static func patch(_ path: String, queryParams: [(String, String?)]? = nil, headers: [String: String]? = nil) -> Request {
//	   Request(method: .patch, path: path, queryParams: queryParams, headers: headers)
//   }
//
//   public static func patch<U: Encodable>(_ path: String, queryParams: [(String, String?)]? = nil, body: U?, headers: [String: String]? = nil) -> Request {
//	   Request(method: .patch, path: path, queryParams: queryParams, body: body, headers: headers)
//   }
//
//   public static func delete(_ path: String, queryParams: [(String, String?)]? = nil, headers: [String: String]? = nil) -> Request {
//	   Request(method: .delete, path: path, queryParams: queryParams, headers: headers)
//   }
//
//   public static func delete<U: Encodable>(_ path: String, queryParams: [(String, String?)]? = nil, body: U?, headers: [String: String]? = nil) -> Request {
//	   Request(method: .delete, path: path, queryParams: queryParams, body: body, headers: headers)
//   }
//
//   public static func options(_ path: String, queryParams: [(String, String?)]? = nil, headers: [String: String]? = nil) -> Request {
//	   Request(method: .options, path: path, queryParams: queryParams, headers: headers)
//   }
//
//   public static func head(_ path: String, queryParams: [(String, String?)]? = nil, headers: [String: String]? = nil) -> Request {
//	   Request(method: .head, path: path, queryParams: queryParams, headers: headers)
//   }
//
//   public static func trace(_ path: String, queryParams: [(String, String?)]? = nil, headers: [String: String]? = nil) -> Request {
//	   Request(method: .trace, path: path, queryParams: queryParams, headers: headers)
//   }
