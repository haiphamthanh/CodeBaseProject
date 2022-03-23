//
//  APIError.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 23/03/2022.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2021-2022 Alexander Grebenyuk (github.com/kean).

import Foundation

public enum APIError: Error, LocalizedError {
	case unacceptableStatusCode(Int)
	
	public var errorDescription: String? {
		switch self {
		case .unacceptableStatusCode(let statusCode):
			return "Response status code was unacceptable: \(statusCode)."
		}
	}
}
