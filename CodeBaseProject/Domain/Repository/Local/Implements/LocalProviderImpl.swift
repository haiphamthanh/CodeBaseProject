//
//  LocalProviderImpl.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 10/04/2022.
//

import Foundation

class LocalProviderImpl: LocalProvider {
	var user: UserLocal {
		return UserLocalImpl()
	}
}
