//
//  File1.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 08/04/2022.
//

import Foundation

protocol AppNotificationProvider {
	// MARK: - Setup
	func requestPermission() -> Self
	func startMonitoring() -> Self
	func done() -> Bool
}
