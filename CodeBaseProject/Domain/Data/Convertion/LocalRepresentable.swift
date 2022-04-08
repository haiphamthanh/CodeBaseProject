//
//  LocalRepresentable.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 03/04/2022.
//

import Foundation

protocol LocalRepresentable {
	associatedtype LocalType: DomainConvertibleType
	
	var uid: String { get }
	
	func asLocalData() -> LocalType
}
