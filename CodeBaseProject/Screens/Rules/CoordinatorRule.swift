//
//  CoordinatorRule.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 08/04/2022.
//

import SwiftUI
import RxSwift

enum PresentType: Int {
	case push
	case present
	case updateRoot
}

protocol CoordinatorRule {
	associatedtype IndividualViewModel
	var indViewModel: IndividualViewModel { get }
	
	func startProcess(on presentType: PresentType) -> Observable<Void>
}
