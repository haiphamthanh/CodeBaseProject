//
//  APIClient.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 23/03/2022.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2021-2022 Alexander Grebenyuk (github.com/kean).

import Foundation

public protocol APIClientDelegate {
	func client(_ client: APIClient, willSendRequest request: inout URLRequest) async throws
	func shouldClientRetry(_ client: APIClient, withError error: Error) async throws -> Bool
	func client(_ client: APIClient, didReceiveInvalidResponse response: HTTPURLResponse, data: Data) -> Error
}

public extension APIClientDelegate {
	func client(_ client: APIClient, willSendRequest request: inout URLRequest) async throws {}
	func shouldClientRetry(_ client: APIClient, withError error: Error) async throws -> Bool { false }
	func client(_ client: APIClient, didReceiveInvalidResponse response: HTTPURLResponse, data: Data) -> Error {
		APIError.unacceptableStatusCode(response.statusCode)
	}
}

public protocol APIClientP {
	/// Sends the given request and returns a response with a decoded response value.
	func response<T: Decodable>(from request: Request<T?>) async throws -> Response<T?>
	/// Sends the given request and returns a response with a decoded response value.
	func response<T: Decodable>(from request: Request<T>) async throws -> Response<T>;
	/// Sends the given request.
	@discardableResult
	func response(from request: Request<Void>) async throws -> Response<Void>;
	/// Returns response data for the given url request.
	func data<T>(for request: Request<T>) async throws -> Response<Data>;
}

public actor APIClient {
	public struct Configuration {
		public var host: String
		public var port: Int?
		public var delegate: APIClientDelegate?
		public var sessionConfiguration: URLSessionConfiguration = .default
		
		/// If `true`, uses `http` instead of `https`.
		public var isInsecure = false
		/// By default, uses encoder with `.iso8601` date encoding strategy.
		public var encoder: JSONEncoder?
		/// By default, uses decoder with `.iso8601` date decoding strategy.
		public var decoder: JSONDecoder?
		/// The (optional) URLSession delegate that allows you to monitor the underlying URLSession.
		public var sessionDelegate: URLSessionDelegate?
		
		public init(host: String, sessionConfiguration: URLSessionConfiguration = .default, delegate: APIClientDelegate? = nil) {
			self.host = host
			self.sessionConfiguration = sessionConfiguration
			self.delegate = delegate
		}
	}
	private struct DefaultAPIClientDelegate: APIClientDelegate {}
	
	private let conf: Configuration
	private let session: URLSession
	private let serializer: Serializer
	private let delegate: APIClientDelegate
	private let loader = DataLoader()
	
	/// Initializes the client with the given parameters.
	///
	/// - parameter host: A host to be used for requests with relative paths.
	/// - parameter configure: Updates the client configuration.
	public convenience init(host: String, _ configure: (inout APIClient.Configuration) -> Void = { _ in }) {
		var configuration = Configuration(host: host)
		configure(&configuration)
		
		self.init(configuration: configuration)
	}
	
	/// Initializes the client with the given configuration.
	public init(configuration: Configuration) {
		// 1
		self.conf = configuration
		// 2
		let queue = OperationQueue(maxConcurrentOperationCount: 1)
		let delegate = URLSessionProxyDelegate.make(loader: loader, delegate: configuration.sessionDelegate)
		self.session = URLSession(configuration: configuration.sessionConfiguration, delegate: delegate, delegateQueue: queue)
		// 3
		self.delegate = configuration.delegate ?? DefaultAPIClientDelegate()
		self.serializer = Serializer(decoder: configuration.decoder, encoder: configuration.encoder)
	}
}

// MARK: - ================================= Usage =================================
extension APIClient: APIClientP {
	/// Sends the given request and returns a response with a decoded response value.
	public func response<T: Decodable>(from request: Request<T?>) async throws -> Response<T?> {
		try await response(from: request) { data in
			return data.isEmpty ? nil : try await self.decode(data)
		}
	}
	
	/// Sends the given request and returns a response with a decoded response value.
	public func response<T: Decodable>(from request: Request<T>) async throws -> Response<T> {
		try await response(from: request, decode)
	}
	
	/// Sends the given request.
	@discardableResult
	public func response(from request: Request<Void>) async throws -> Response<Void> {
		try await response(from: request) { _ in () }
	}
	
	/// Returns response data for the given url request.
	public func data<T>(for request: Request<T>) async throws -> Response<Data> {
		let urlRequest = try await urlRequest(for: request)
		return try await response(from: urlRequest)
	}
}

// MARK: - ================================= Senders =================================
private extension APIClient {
	/// Returns response data for the given request.
	func response<T>(from request: Request<T>,
					 _ decode: @escaping (Data) async throws -> T) async throws -> Response<T> {
		let response = try await data(for: request)
		let value = try await decode(response.value)
		
		return response.map { _ in value } // Keep metadata
	}
	
	/// Returns response data for the given url request.
	func response(from urlRequest: URLRequest) async throws -> Response<Data> {
		do {
			return try await actualResponse(from: urlRequest)
		} catch {
			guard try await delegate.shouldClientRetry(self, withError: error) else { throw error }
			return try await actualResponse(from: urlRequest)
		}
	}
}

// MARK: - ================================= Private =================================
private extension APIClient {
	func urlRequest<T>(for request: Request<T>) async throws -> URLRequest {
		let url = try url(with: request.path, queryParams: request.queryParams)
		return try await urlRequest(url: url,
									method: request.method,
									body: request.body,
									headers: request.headers)
	}
	
	func actualResponse(from urlRequest: URLRequest) async throws -> Response<Data> {
		var request = urlRequest
		try await delegate.client(self, willSendRequest: &request)
		
		let (data, urlResponse, metrics) = try await loader.data(for: request, session: session)
		try validate(urlResponse: urlResponse, data: data)
		
		return Response(value: data,
						data: data,
						urlRequest: urlRequest,
						urlResponse: urlResponse,
						metrics: metrics)
	}
	
	func decode<T: Decodable>(_ data: Data) async throws -> T {
		switch T.self {
		case is Data.Type:
			return data as! T
		case is String.Type:
			guard let string = String(data: data, encoding: .utf8) else { throw URLError(.badServerResponse) }
			return string as! T
		default:
			return try await self.serializer.decode(data)
		}
	}
}

// MARK: - ================================= Atomics =================================
private extension APIClient {
	func url(with path: String, queryParams: QueryParams?) throws -> URL {
		guard let url = URL(string: path),
			  var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
			throw URLError(.badURL)
		}
		if path.starts(with: "/") {
			components.scheme = conf.isInsecure ? "http" : "https"
			components.host = conf.host
			if let port = conf.port {
				components.port = port
			}
		}
		if let queryParams = queryParams {
			components.queryItems = queryParams.map(URLQueryItem.init)
//			components.setQueryOptionalItems(with: queryParams)
		}
		guard let url = components.url else {
			throw URLError(.badURL)
		}
		return url
	}
	
	func urlRequest(url: URL, method: HTTPMethod, body: AnyEncodable?, headers: [String: String]?) async throws -> URLRequest {
		var request = URLRequest(url: url)
		request.allHTTPHeaderFields = headers
		request.httpMethod = method.rawValue
		
		if let body = body {
			request.httpBody = try await serializer.encode(body)
			request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		}
		request.setValue("application/json", forHTTPHeaderField: "Accept")
		
		return request
	}
	
	func validate(urlResponse: URLResponse, data: Data) throws {
		guard let httpResponse = urlResponse as? HTTPURLResponse else { return }
		if !(200..<300).contains(httpResponse.statusCode) {
			throw delegate.client(self, didReceiveInvalidResponse: httpResponse, data: data)
		}
	}
}
