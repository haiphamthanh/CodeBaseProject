//
//  UserAPI.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 24/03/2022.
//

import Foundation

// MARK: - ================================= Path =================================
// C
fileprivate let PATH_USER_REGISTER = "/user/register" // Register new account
// R
fileprivate let PATH_USER_DETAIL = "/user/detail" // User detail
fileprivate let PATH_USER_MAIL = "/user/emails" // User detail

// MARK: - ================================= API Interface =================================
enum UserAPI {
	case userMail
	case userInfo(params: UserRequestParams)
	case register(params: UserRegisterRequestParams)
}

// MARK: - ================================= API Params =================================
extension UserAPI: Endpoint {
	var host: String {
		switch self {
		case .userInfo:
			return "host_1"
		case .userMail:
			return "host_2"
		case .register:
			return "host_3"
		}
	}
	
	var path: String {
		switch self {
		case .userInfo:
			return PATH_USER_DETAIL
		case .userMail:
			return PATH_USER_MAIL
		case .register:
			return PATH_USER_REGISTER
		}
	}
	
	var method: HTTPMethod {
		switch self {
		case .userInfo, .userMail:
			return .get
		case .register:
			return .post
		}
	}
	
	var task: Task {
		switch self {
		case .userMail:
			return .requestPlain
		case .userInfo(let params):
			return .requestParameters(parameters: params, translating: URLEncoding.default)
		case .register(let params):
			return .requestParameters(parameters: params, translating: URLEncoding.default)
		}
	}
	
	var validate: Bool {
		return true
	}
	
	var headers: [String : String]? {
		return nil
	}
}
