//
//  AppBackgroundProvider.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 08/04/2022.
//

import Foundation

protocol AppBackgroundProvider {
	// MARK: - Setup
	func setting1() -> Self
	func setting2() -> Self
	func done() -> Bool
}
