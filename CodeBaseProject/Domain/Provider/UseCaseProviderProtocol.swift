//
//  UseCaseProviderProtocol.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 02/04/2022.
//

import Foundation
/**
Provide usecase to call api
*/
protocol UseCaseProviderProtocol {
	var user: UserUseCase { get }
}
