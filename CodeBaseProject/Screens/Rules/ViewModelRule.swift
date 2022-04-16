//
//  ViewModelRule.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 08/04/2022.
//

import RxSwift

protocol ViewModelRule {
	// MARK: Coordinator - Outputs
	var didDone: Observable<Void> { get }
}
