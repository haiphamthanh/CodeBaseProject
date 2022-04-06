//
//  AppModelPresentation.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 03/04/2022.
//

import Foundation

protocol AppModelPresentation {
	associatedtype AppModelType
	func asAppModel() -> AppModelType
}
