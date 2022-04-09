//
//  ViewRule.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 08/04/2022.
//

import Foundation

protocol ViewRule {
	associatedtype VM where VM: ViewModelRule
	var viewModel: VM { get }
}
