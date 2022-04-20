//
//  UseCaseProvider.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 02/04/2022.
//

import Foundation
/**
Provide usecase to call api
*/
protocol UseCaseProvider {
	var user: UserUseCase { get }
}
