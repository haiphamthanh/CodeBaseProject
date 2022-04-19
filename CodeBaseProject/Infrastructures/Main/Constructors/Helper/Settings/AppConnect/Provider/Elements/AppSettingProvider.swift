//
//  AppSettingProvider.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 19/04/2022.
//

import Foundation

protocol AppSettingProvider {
	func setupKeyboard() -> Self
	func trackingNetwork() -> Self
	func done() -> Bool
}
