//
//  TaskNew.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 24/03/2022.
//

import Foundation

/// A dictionary of parameters to apply to a `URLRequest`.
public typealias Parameters = [String: Any?]

/// Represents an HTTP task.
public enum Task {
	
	/// A request with no additional data.
	case requestPlain
	
	/// A requests body set with encoded parameters.
	case requestParameters(parameters: Encodable, translating: ParameterTranslating)
}

/*
 /// A type used to define how a set of parameters are applied to a `URLRequest`.
 public protocol ParameterTranslating {
 /// Creates a `URLRequest` by encoding parameters and applying them on the passed request.
 ///
 /// - Parameters:
 ///   - urlRequest: `URLRequestConvertible` value onto which parameters will be encoded.
 ///   - parameters: `Parameters` to encode onto the request.
 ///
 /// - Returns:      The encoded `URLRequest`.
 /// - Throws:       Any `Error` produced during parameter encoding.
 func flatParameters(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> [(String, String)]
 }
 
 public struct URLEncoding: ParameterEncoding {
 // MARK: Helper Types
 
 /// Defines whether the url-encoded query string is applied to the existing query string or HTTP body of the
 /// resulting URL request.
 public enum Destination {
 /// Applies encoded query string result to existing query string for `GET`, `HEAD` and `DELETE` requests and
 /// sets as the HTTP body for requests with any other HTTP method.
 case methodDependent
 /// Sets or appends encoded query string result to existing query string.
 case queryString
 /// Sets encoded query string result as the HTTP body of the URL request.
 case httpBody
 
 func encodesParametersInURL(for method: HTTPMethod) -> Bool {
 switch self {
 case .methodDependent: return [.get, .head, .delete].contains(method)
 case .queryString: return true
 case .httpBody: return false
 }
 }
 }
 
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
 
 /// The destination defining where the encoded query string is to be applied to the URL request.
 public let destination: Destination
 
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
 public init(destination: Destination = .methodDependent,
 arrayEncoding: ArrayEncoding = .brackets,
 boolEncoding: BoolEncoding = .numeric) {
 self.destination = destination
 self.arrayEncoding = arrayEncoding
 self.boolEncoding = boolEncoding
 }
 
 
 // MARK: - Utils
 /// Returns a default `URLEncoding` instance with a `.methodDependent` destination.
 public static var `default`: URLParameterTranslating { URLParameterTranslating() }
 
 /// Returns a `URLEncoding` instance with a `.queryString` destination.
 public static var queryString: URLParameterTranslating { URLParameterTranslating(destination: .queryString) }
 
 /// Returns a `URLEncoding` instance with an `.httpBody` destination.
 public static var httpBody: URLParameterTranslating { URLParameterTranslating(destination: .httpBody) }
 
 // MARK: Flating
 public func flatParameters(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> [(String, String)] {
 guard let parameters = parameters else {
 return []
 }
 
 let urlRequest = try urlRequest.asURLRequest()
 if let method = urlRequest.method, destination.encodesParametersInURL(for: method) {
 return flatParameters(parameters)
 }
 
 return []
 }
 }
 
 private extension URLParameterTranslating {
 private func flatParameters(_ parameters: [String: Any]) -> [(String, String)] {
 var flatParameters: [(String, String)] = []
 
 for key in parameters.keys.sorted(by: <) {
 let value = parameters[key]!
 flatParameters += queryComponents(fromKey: key, value: value)
 }
 
 return flatParameters
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
 
 */
