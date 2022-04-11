//
//  File.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 08/04/2022.
//

import Foundation

protocol AppSettingProvider {
	// MARK: - Setup
	func settingInternalTools() -> Self
	func settingExternalTools() -> Self
	func done()
}
