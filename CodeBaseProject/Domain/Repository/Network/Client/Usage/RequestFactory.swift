//
//  RequestFactory.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 25/03/2022.
//

import Foundation

class RequestFactory<Target, O> where Target: Endpoint, O: Decodable {
	func request(for target: Target) -> Request<O>? {
		let path = target.path
		let method = target.method
		let task = target.task
		let headers = target.headers
		
		// Un-unsed properties
		//		let host = target.host
		//		let validationType = target.validationType
		//		let sampleData = target.sampleData
		
		let paramBridge = task.paramBridge
		let queryParams = paramBridge.queryParams
		let body = paramBridge.body
		
		switch method {
		case .get:
			return Request.get(path, queryParams: queryParams, headers: headers)
		case .post:
			return Request.post(path, queryParams: queryParams, body: body, headers: headers)
		case .put:
			return Request.put(path, queryParams: queryParams, body: body, headers: headers)
		case .delete:
			return Request.delete(path, queryParams: queryParams, body: body, headers: headers)
		default:
			fatalError("None support for other methods")
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

public typealias Parameters = [String: Any?]
public protocol ParameterEncoding {
	associatedtype Output
	func encode(_ parameter: Encodable) -> Output
	//	func flatParameters(_ parameters: Parameters?, with method: HTTPMethod) -> [(String, String)]
	//	func flatParameters(_ parameters: Encodable?, with method: HTTPMethod) -> [(String, String)]
}

public protocol UrlParameterEncoding: ParameterEncoding {
	func encode(_ parameter: Parameters) -> Output
	//	func flatParameters(_ parameters: Parameters?, with method: HTTPMethod) -> [(String, String)]
	//	func flatParameters(_ parameters: Encodable?, with method: HTTPMethod) -> [(String, String)]
}

public struct BodyEncoding: ParameterEncoding {
	public typealias Output = Encodable
	
	// MARK: - Utils
	/// Returns a default `URLEncoding` instance with a `.methodDependent` destination.
	public static var `default`: BodyEncoding { BodyEncoding() }
	
	public func encode(_ parameter: Encodable) -> Output {
		return parameter
	}
}

public struct URLEncoding: UrlParameterEncoding {
	public typealias Output = [(String, String)]
	// MARK: Helper Types
	
	/// Configures how `Array` parameters are encoded.
	public enum ArrayEncoding {
		/// An empty set of square brackets is appended to the key for every value. This is the default behavior.
		case brackets
		/// No brackets are appended. The key is encoded as is.
		case noBrackets
		
		func encode(key: String) -> String {
			switch self {
			case .brackets:
				return "\(key)[]"
			case .noBrackets:
				return key
			}
		}
	}
	
	/// Configures how `Bool` parameters are encoded.
	public enum BoolEncoding {
		/// Encode `true` as `1` and `false` as `0`. This is the default behavior.
		case numeric
		/// Encode `true` and `false` as string literals.
		case literal
		
		func encode(value: Bool) -> String {
			switch self {
			case .numeric:
				return value ? "1" : "0"
			case .literal:
				return value ? "true" : "false"
			}
		}
	}
	
	// MARK: Properties
	
	/// The encoding to use for `Array` parameters.
	public let arrayEncoding: ArrayEncoding
	
	/// The encoding to use for `Bool` parameters.
	public let boolEncoding: BoolEncoding
	
	// MARK: Initialization
	
	/// Creates an instance using the specified parameters.
	///
	/// - Parameters:
	///   - destination:   `Destination` defining where the encoded query string will be applied. `.methodDependent` by
	///                    default.
	///   - arrayEncoding: `ArrayEncoding` to use. `.brackets` by default.
	///   - boolEncoding:  `BoolEncoding` to use. `.numeric` by default.
	public init(arrayEncoding: ArrayEncoding = .brackets,
				boolEncoding: BoolEncoding = .numeric) {
		self.arrayEncoding = arrayEncoding
		self.boolEncoding = boolEncoding
	}
	
	// MARK: - Utils
	/// Returns a default `URLEncoding` instance with a `.methodDependent` destination.
	public static var `default`: URLEncoding { URLEncoding() }
	
	// MARK: Flating
	public func encode(_ parameter: Encodable) -> Output {
		guard let dictionary = parameter.dictionary else {
			return []
		}
		
		return encodedParameters(dictionary)
	}
	
	public func encode(_ parameter: Parameters) -> Output {
		return encodedParameters(parameter)
	}
}

private extension URLEncoding {
	private func encodedParameters(_ parameters: [String: Any?]) -> [(String, String)] {
		var encodedParameters: [(String, String)] = []
		
		for key in parameters.keys.sorted(by: <) {
			let value = parameters[key]!
			encodedParameters += queryComponents(fromKey: key, value: value ?? "")
		}
		
		return encodedParameters
	}
	
	/// Creates a percent-escaped, URL encoded query string components from the given key-value pair recursively.
	///
	/// - Parameters:
	///   - key:   Key of the query component.
	///   - value: Value of the query component.
	///
	/// - Returns: The percent-escaped, URL encoded query string components.
	private func queryComponents(fromKey key: String, value: Any) -> [(String, String)] {
		var components: [(String, String)] = []
		
		switch value {
		case let dictionary as [String: Any]:
			for (nestedKey, value) in dictionary {
				components += queryComponents(fromKey: "\(key)[\(nestedKey)]", value: value)
			}
		case let array as [Any]:
			for value in array {
				components += queryComponents(fromKey: arrayEncoding.encode(key: key), value: value)
			}
		case let number as NSNumber:
			if number.isBool {
				components.append((escape(key), escape(boolEncoding.encode(value: number.boolValue))))
			} else {
				components.append((escape(key), escape("\(number)")))
			}
		case let bool as Bool:
			components.append((escape(key), escape(boolEncoding.encode(value: bool))))
		default:
			components.append((escape(key), escape("\(value)")))
		}
		
		return components
	}
	
	/// Creates a percent-escaped string following RFC 3986 for a query string key or value.
	///
	/// - Parameter string: `String` to be percent-escaped.
	///
	/// - Returns:          The percent-escaped `String`.
	private func escape(_ string: String) -> String {
		string.addingPercentEncoding(withAllowedCharacters: .uRLQueryAllowed) ?? string
	}
}

// Utils
extension NSNumber {
	fileprivate var isBool: Bool {
		// Use Obj-C type encoding to check whether the underlying type is a `Bool`, as it's guaranteed as part of
		// swift-corelibs-foundation, per [this discussion on the Swift forums](https://forums.swift.org/t/alamofire-on-linux-possible-but-not-release-ready/34553/22).
		String(cString: objCType) == "c"
	}
}

