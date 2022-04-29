//
//  ViewModelRule.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 08/04/2022.
//

import RxSwift

protocol ViewModelRule: AnyObject {
	// MARK: Coordinator - Outputs
	var didDone: Observable<Void> { get }
	func delegate(_ sender: AnyObject?)
}
