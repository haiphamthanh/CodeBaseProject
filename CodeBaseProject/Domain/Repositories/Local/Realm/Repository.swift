//
//  Repository.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 25/03/2022.
//

import Foundation
//import Realm
//import RealmSwift
//import RxSwift
//import RxRealm
//
//protocol AbstractRepository {
//	associatedtype T
//	func queryAll() -> Observable<[T]>
//	func query(with predicate: NSPredicate,
//			   sortDescriptors: [NSSortDescriptor]) -> Observable<[T]>
//	func save(entity: T) -> Observable<[T]>
//	func delete(entity: T) -> Observable<[T]>
//}
//
//final class Repository<T: RealmRepresentable>: AbstractRepository where T == T.RealmType.DomainType, T.RealmType: Object {
//	private let configuration: Realm.Configuration
//	private let scheduler: RunLoopThreadScheduler
//
//	private var realm: Realm {
//		return try! Realm(configuration: self.configuration)
//	}
//
//	// TODO: Refactor here
//	init(configuration: Realm.Configuration) {
//		self.configuration = configuration
//		let name = "com.CleanArchitectureRxSwift.RealmPlatform.Repository"
//		self.scheduler = RunLoopThreadScheduler(threadName: name)
//
//		print("File 📁 url: \(RLMRealmPathForFile("default.realm"))")
//	}
//
//	func queryAll() -> Observable<[T]> {
//		return Observable.deferred {
//			let realm = self.realm
//			let objects = realm.objects(T.RealmType.self)
//
//			return Observable
//				.array(from: objects)
//				.mapToDomain()
//			}
//			.subscribeOn(scheduler)
//	}
//
//	func query(with predicate: NSPredicate,
//			   sortDescriptors: [NSSortDescriptor] = []) -> Observable<[T]> {
//		return Observable
//			.deferred {
//				let realm = self.realm
//				let objects = realm.objects(T.RealmType.self)
//					.filter(predicate)
//					.sorted(by: sortDescriptors.map(SortDescriptor.init))
//
//				//            The implementation is broken since we are not using predicate and sortDescriptors
//				//            but it cause compiler to crash with xcode 8.3 ¯\_(ツ)_/¯
//				//                            .filter(predicate)
//				//                            .sorted(by: sortDescriptors.map(SortDescriptor.init))
//
//				return Observable
//					.array(from: objects)
//					.mapToDomain()
//			}
//			.subscribeOn(scheduler)
//	}
//
//	func save(entity: T) -> Observable<[T]> {
//		return Observable
//			.deferred {
//				return self.realm.rx.save(entity: entity)
//			}
//			.map({ [$0] })
//			.subscribeOn(scheduler)
//	}
//
//	func delete(entity: T) -> Observable<[T]> {
//		return Observable
//			.deferred {
//				return self.realm.rx.delete(entity: entity)
//			}
//			.map({ [$0] })
//			.subscribeOn(scheduler)
//	}
//}
