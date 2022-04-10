//
//  OfflineAction.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 29/03/2022.
//
//  https://medium.com/@mario.negro.martin/using-step-builder-pattern-in-swift-f8bd6ecd3677

import Foundation

protocol OfflineRequestConvertible {}
extension String: OfflineRequestConvertible {}
typealias OfflineControllerCompletionHandler = (OfflineAction) -> Void

struct OfflineAction {
	
	enum `Type` {
		case cache, get, delete
	}
	
	fileprivate(set) var type: Type?
	fileprivate(set) var request: OfflineRequestConvertible?
	fileprivate(set) var data: Data?
	fileprivate(set) var id: String?
	fileprivate(set) var encryptionKey: String?
	fileprivate(set) var keepAliveUntil: Date?
	fileprivate(set) var ifBefore: Date?
}

// 1. Tạo một giao thức build
protocol BuildStep {
	func build() -> OfflineAction
}

// 2. Các giao thức hành động
// 2.1 Common step
protocol CommonsStep: BuildStep {
	func forId(_ id: String) -> Self
	func withEncryptionKey(_ encryptionKey: String) -> Self
}
// 2.2 Cache Data
protocol CacheCommonsStep: CommonsStep {
	func keepingAliveUntil(_ date: Date) -> Self
}
// 2.3 Get Data
protocol GetCommonsStep: CommonsStep {
	func ifBefore(_ date: Date) -> Self
}
// 2.4 Data
protocol DataStep {
	func data(_ data: Data) -> CacheCommonsStep
}
// 2.2 Request
protocol RequestStep {
	func toCache(_ request: OfflineRequestConvertible) -> DataStep
	func toGet(_ request: OfflineRequestConvertible) -> GetCommonsStep
	func toDelete(_ request: OfflineRequestConvertible) -> CommonsStep
}

class OfflineActionBuilder {
	
	fileprivate var action: OfflineAction!
	
	init() {
		fatalError("This type cannot be constructed directly, use static var 'builder' instead.")
	}
	
	private init(_ action: OfflineAction) {
		self.action = action
	}
	
	static var builder: RequestStep {
		return OfflineActionBuilder(OfflineAction()) as RequestStep
	}
}

extension OfflineActionBuilder: RequestStep, DataStep, CommonsStep, CacheCommonsStep, GetCommonsStep {
	func toCache(_ request: OfflineRequestConvertible) -> DataStep {
		action.type = .cache
		action.request = request
		return self as DataStep // DataStep is Required
	}
	
	func toGet(_ request: OfflineRequestConvertible) -> GetCommonsStep {
		action.type = .get
		action.request = request
		return self as GetCommonsStep // GetCommonsStep is Required
	}
	
	func toDelete(_ request: OfflineRequestConvertible) -> CommonsStep {
		action.type = .delete
		action.request = request
		return self as CommonsStep // CommonsStep is Required
	}
	
	func data(_ data: Data) -> CacheCommonsStep {
		action.data = data
		return self as CacheCommonsStep // CacheCommonsStep is Required
	}
	
	func forId(_ id: String) -> Self {
		action.id = id
		return self
	}
	
	func withEncryptionKey(_ encryptionKey: String) -> Self {
		action.encryptionKey = encryptionKey
		return self
	}
	
	func keepingAliveUntil(_ date: Date) -> Self {
		action.keepAliveUntil = date
		return self
	}
	
	func ifBefore(_ date: Date) -> Self {
		action.ifBefore = date
		return self
	}
	
	func build() -> OfflineAction {
		return action
	}
}

//protocol OfflineController {
//	func cache(request: OfflineRequestConvertible, forId id: String?, encryptionKey: String?, data: Data, keepAliveUntil keepAlive: Date?, completion: @escaping OfflineControllerCompletionHandler)
//	func get(request: OfflineRequestConvertible, forId id: String?, encryptionKey: String?, ifBefore before: Date?, completion: @escaping OfflineControllerCompletionHandler)
//	func delete(request: OfflineRequestConvertible, forId id: String?, encryptionKey: String?, completion: @escaping OfflineControllerCompletionHandler)
//}
//============== Được viết lại thành ==============
protocol OfflineController {
	func execute(action: OfflineAction, completion: @escaping OfflineControllerCompletionHandler)
}

//============== Usage ==============
private class Actor {
	func loadRequest() {
		let cache = OfflineActionBuilder.builder
			.toCache("https://www.medium.com")
			.data(Data())
			.forId("id")
			.keepingAliveUntil(Date())
			.build()
		
		let saveController = SaveDataController()
		saveController.execute(action: cache, completion: {_ in
			// do something on returned results
		})
	}
}
private class SaveDataController: OfflineController {
	func execute(action: OfflineAction, completion: @escaping OfflineControllerCompletionHandler) {
		let cache = OfflineActionBuilder.builder
			.toCache("https://www.medium.com")
			.data(Data())
			.forId("id")
			.keepingAliveUntil(Date())
			.build()
		
		completion(cache)
	}
}
