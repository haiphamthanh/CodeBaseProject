//
//  URLSessionProxyDelegate.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 23/03/2022.
//  Allows users to monitor URLSession.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2021-2022 Alexander Grebenyuk (github.com/kean).

import Foundation

final class URLSessionProxyDelegate: NSObject, URLSessionTaskDelegate, URLSessionDataDelegate {
	private var delegate: URLSessionDelegate
	private let interceptedSelectors: Set<Selector>
	private let loader: DataLoader
	
	private init(loader: DataLoader, delegate: URLSessionDelegate) {
		self.loader = loader
		self.delegate = delegate
		self.interceptedSelectors = [
			#selector(URLSessionDataDelegate.urlSession(_:dataTask:didReceive:)),
			#selector(URLSessionTaskDelegate.urlSession(_:task:didCompleteWithError:)),
			#selector(URLSessionTaskDelegate.urlSession(_:task:didFinishCollecting:))
		]
	}
	
	// MARK: URLSessionDelegate
	func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
		loader.urlSession(session, dataTask: dataTask, didReceive: data)
		(delegate as? URLSessionDataDelegate)?.urlSession?(session, dataTask: dataTask, didReceive: data)
	}

	func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
		loader.urlSession(session, task: task, didCompleteWithError: error)
		(delegate as? URLSessionTaskDelegate)?.urlSession?(session, task: task, didCompleteWithError: error)
	}
	
	func urlSession(_ session: URLSession, task: URLSessionTask, didFinishCollecting metrics: URLSessionTaskMetrics) {
		loader.urlSession(session, task: task, didFinishCollecting: metrics)
		(delegate as? URLSessionTaskDelegate)?.urlSession?(session, task: task, didFinishCollecting: metrics)
	}

	// MARK: Proxy
	override func responds(to aSelector: Selector!) -> Bool {
		if interceptedSelectors.contains(aSelector) {
			return true
		}
		return delegate.responds(to: aSelector) || super.responds(to: aSelector)
	}

	override func forwardingTarget(for selector: Selector!) -> Any? {
		interceptedSelectors.contains(selector) ? nil : delegate
	}
}

// MARK: - ================================= Usage =================================
extension URLSessionProxyDelegate: URLSessionDelegate {
	static func make(loader: DataLoader, delegate: URLSessionDelegate?) -> URLSessionDelegate {
		guard let delegate = delegate else { return loader }
		return URLSessionProxyDelegate(loader: loader, delegate: delegate)
	}
}
