//
//  ErrorManager.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 03/04/2022.
//

import Foundation

/// `DomainError` is the error type returned by App. It encompasses a few different types of errors, each with
/// their own associated reasons.
public enum DomainError: Error {
	public enum UserInputRequestParamReason {
		case valueIsNil
		case valueIsEmty
		case valueWrongType
		case invalidData(String?)
	}
}

extension DomainError.UserInputRequestParamReason: LocalizedError {
	public var errorDescription: String? {
		switch self {
		case .valueIsNil:
			return "Value is nil"
		case .valueIsEmty:
			return "Value is empty"
		case .valueWrongType:
			return "Value is wrong type"
		case .invalidData(let message):
			return "Data is invalid \(message ?? "No description.")"
		}
	}
}

extension DomainError.UserInputRequestParamReason {
	var localizedDescription: String {
		switch self {
		case .valueIsNil:
			return "The value provided is nil"
		case .valueIsEmty:
			return "The value provided is empty"
		case .valueWrongType:
			return "The value provided does not confirm to valid type"
		case .invalidData(let message):
			return "The data provided does not have a valid condition \(message ?? "No description."))"
		}
	}
}
