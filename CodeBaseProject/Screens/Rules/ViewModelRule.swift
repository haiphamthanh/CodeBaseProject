//
//  ViewModelRule.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 08/04/2022.
//

import Foundation

protocol ViewModelRule {
	associatedtype C where C: CoordinatorRule
	var coordinator: C { get }
}