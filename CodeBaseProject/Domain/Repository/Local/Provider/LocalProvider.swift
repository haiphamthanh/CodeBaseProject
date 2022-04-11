//
//  LocalProvider.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 10/04/2022.
//

import Foundation

/**
Provide local to store data
*/
protocol LocalProvider {
	var user: UserLocal { get }
}
