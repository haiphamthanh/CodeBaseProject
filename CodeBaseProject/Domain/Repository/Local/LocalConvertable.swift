//
//  LocalConvertable.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 03/04/2022.
//

import Foundation

protocol LocalConvertable {
	associatedtype LocalType
	func asLocalEntity() -> LocalType
}
