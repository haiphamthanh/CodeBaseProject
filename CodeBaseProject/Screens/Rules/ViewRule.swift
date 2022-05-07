//
//  ViewRule.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 08/04/2022.
//

import Foundation

protocol ViewRule {
	associatedtype IProps// where VM: ViewModelRule
	var props: IProps { get }
}
