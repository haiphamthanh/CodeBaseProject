//
//  AppDataPresentation.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 03/04/2022.
//

import Foundation

protocol AppDataPresentation {
	associatedtype AppDataType
	func asAppData() -> AppDataType
}
