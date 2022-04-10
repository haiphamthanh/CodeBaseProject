//
//  RepoProvider.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 02/04/2022.
//

import Foundation

/**
Repository to handle data
*/
protocol RepoProvider {
	var userRepo: UserRepository { get }
}
