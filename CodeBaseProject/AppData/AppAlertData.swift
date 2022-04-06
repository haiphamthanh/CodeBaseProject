//
//  AppAlertData.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 05/04/2022.
//

import Foundation

struct AppAlertData: Identifiable {
	enum Status {
		case error
		case successful
	}
	
	let id: UUID = UUID()
	
	var title: String
	let status: Status
	let message: String
	let completion: (() -> Void)?
}
