//
//  Convertible.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 30/03/2022.
//

import Foundation


public protocol URLRequestConvertible {
	/// Returns a `URLRequest` or throws if an `Error` was encountered.
	///
	/// - Returns: A `URLRequest`.
	/// - Throws:  Any error thrown while constructing the `URLRequest`.
	func asURLRequest() throws -> URLRequest
}
