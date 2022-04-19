//
//  PluginManager.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 09/04/2022.
//

import Foundation

protocol PluginProvider {
	var facebook: FacebookPlugin { get }
	var google: GooglePlugin { get }
	var firebase: FirebasePlugin { get }
	var networkLog: NetworkLogPlugin { get }
	var webSocket: WebSocketPlugin { get }
	var networkSecurity: NetworkSecurityPlugin { get }
	var appSecurity: AppSecurityPlugin { get }
	
}

class PluginManager: PluginProvider {
	static let shared = PluginManager()
	private init() { }
	
	lazy var facebook: FacebookPlugin = FacebookPlugin()
	lazy var google: GooglePlugin = GooglePlugin()
	lazy var firebase: FirebasePlugin = FirebasePlugin()
	lazy var networkLog: NetworkLogPlugin = NetworkLogPlugin()
	lazy var webSocket: WebSocketPlugin = WebSocketPlugin()
	lazy var networkSecurity: NetworkSecurityPlugin = NetworkSecurityPlugin()
	lazy var appSecurity: AppSecurityPlugin = AppSecurityPlugin()
}
