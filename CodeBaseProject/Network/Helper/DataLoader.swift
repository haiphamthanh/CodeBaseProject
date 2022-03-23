//
//  DataLoader.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 22/03/2022.
//  A simple URLSession wrapper adding async/await APIs compatible with older platforms.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2021-2022 Alexander Grebenyuk (github.com/kean).

import Foundation

protocol DataLoaderP {
	func data(for request: URLRequest, session: URLSession) async throws -> (Data, URLResponse, URLSessionTaskMetrics?)
}

final class DataLoader: NSObject {
	private typealias Completion = (Result<(Data, URLResponse, URLSessionTaskMetrics?), Error>) -> Void
	private final class TaskHandler {
		var data: Data?
		var metrics: URLSessionTaskMetrics?
		let completion: Completion

		init(completion: @escaping Completion) {
			self.completion = completion
		}
	}
	private var handlers = [URLSessionTask: TaskHandler]()
}

// MARK: - ================================= Usage =================================
extension DataLoader: DataLoaderP {
	/// Loads data with the given request.
	func data(for request: URLRequest, session: URLSession) async throws -> (Data, URLResponse, URLSessionTaskMetrics?) {
		final class Box {
			var task: URLSessionTask?
		}
		let box = Box()
		
		return try await withTaskCancellationHandler(handler: {
			box.task?.cancel()
		}, operation: {
			try await withUnsafeThrowingContinuation { continuation in
				box.task = self.loadData(with: request, session: session) { result in
					continuation.resume(with: result)
				}
			}
		})
	}
}

// MARK: - ================================= URLSessionDataDelegate =================================
extension DataLoader: URLSessionDataDelegate {
	func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
		guard let handler = handlers[task] else {
			return
		}
		handlers[task] = nil
		
		if let response = task.response, error == nil {
			handler.completion(.success((handler.data ?? Data(), response, handler.metrics)))
		} else {
			handler.completion(.failure(error ?? URLError(.unknown)))
		}
	}
	
	func urlSession(_ session: URLSession, task: URLSessionTask, didFinishCollecting metrics: URLSessionTaskMetrics) {
		handlers[task]?.metrics = metrics
	}

	func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
		guard let handler = handlers[dataTask] else {
			return
		}
		
		if handler.data == nil {
			handler.data = Data()
		}
		
		handler.data!.append(data)
	}
}

// MARK: - ================================= Private =================================
private extension DataLoader {
	private func loadData(with request: URLRequest,
						  session: URLSession,
						  completion: @escaping Completion) -> URLSessionTask {
		let task = session.dataTask(with: request)
		
		session.delegateQueue.addOperation {
			self.handlers[task] = TaskHandler(completion: completion)
		}
		task.resume()
		
		return task
	}
}
