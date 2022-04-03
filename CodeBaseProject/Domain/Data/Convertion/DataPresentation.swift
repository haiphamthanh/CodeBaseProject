//
//  DataPresentation.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 03/04/2022.
//

import Foundation

protocol DataPresentation {
	associatedtype DataType
	func asData() -> DataType
}
