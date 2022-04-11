//
//  NetworkProvider.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 10/04/2022.
//

import Foundation

/**
Provide network to request api
*/
protocol NetworkProvider {
	var user: UserNetwork { get }
}
