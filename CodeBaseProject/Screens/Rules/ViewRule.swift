//
//  ViewRule.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 08/04/2022.
//

import Foundation

protocol ViewRule {
	associatedtype IPros// where VM: ViewModelRule
	var pros: IPros { get }
}
