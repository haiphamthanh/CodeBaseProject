//
//  DomainConvertibleType.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 03/04/2022.
//

import Foundation

protocol DomainConvertibleType {
	associatedtype DomainType: DataPresentation
	
	func asDomain() -> DomainType
}
