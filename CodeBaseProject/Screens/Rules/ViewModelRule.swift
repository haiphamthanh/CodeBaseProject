//
//  ViewModelRule.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 08/04/2022.
//

import UIKit
import RxSwift

protocol ViewModelRule: AnyObject {
	var id: UUID { get }
	func delegate(_ sender: AnyObject?)
	
	// MARK: Coordinator - Outputs
	var didDone: Observable<Void> { get }
}
