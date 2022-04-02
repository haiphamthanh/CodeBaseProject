//
//  UserAPI.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 24/03/2022.
//

import Foundation

// MARK: - ================================= Path =================================
// C
fileprivate let PATH_USER = "/user/" // Register new account / Update account
// R
fileprivate let PATH_USER_DETAIL = "/user/detail"
fileprivate let PATH_USER_MAIL = "/user/emails"

// MARK: - ================================= API Interface =================================
enum UserAPI {
	case userMail
	case userInfo(params: UserRequestParams)
	case register(params: UserRegisterRequestParams)
	case update(requestParams: UserUpdateRequestParams.Url, bodyParams: UserUpdateRequestParams.Body)
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
		case .update:
			return "host_4"
		}
	}
	
	var path: String {
		switch self {
		case .userInfo:
			return PATH_USER_DETAIL
		case .userMail:
			return PATH_USER_MAIL
		case .register, .update:
			return PATH_USER
		}
	}
	
	var method: HTTPMethod {
		switch self {
		case .userInfo, .userMail:
			return .get
		case .register:
			return .post
		case .update:
			return .put
		}
	}
	
	var task: TaskA {
		switch self {
		case .userMail:
			return .requestPlain
		case .userInfo(let urlParameters):
			let urlRequestParameter = UrlRequestParameter(parameter: urlParameters,
														  encoding: URLEncoding.default)
			return .request(urlRequestParameter: urlRequestParameter)
		case .register(let bodyParameters):
			let bodyRequestParameter = BodyRequestParameter(parameter: bodyParameters,
															encoding: BodyEncoding.default)
			return .requestComposite(urlParameters: nil, bodyParameter: bodyRequestParameter)
		case .update(let urlParameters, let bodyParameters):
			let urlRequestParameter = UrlRequestParameter(parameter: urlParameters,
														  encoding: URLEncoding.default)
			let bodyRequestParameter = BodyRequestParameter(parameter: bodyParameters,
															encoding: BodyEncoding.default)
			return .requestComposite(urlParameters: urlRequestParameter, bodyParameter: bodyRequestParameter)
		}
	}
	
	var validate: Bool {
		return true
	}
	
	var headers: [String : String]? {
		return nil
	}
}
