//
//  DefaultComponentIProps.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 07/05/2022.
//

import SwiftUI

class DefaultComponentIProps<DelegateType> {
	var delegator: DelegateType? {
		return _delegator as? DelegateType
	}
	private weak var _delegator: AnyObject?
	
	init(delegator: DelegateType?) {
		if let delegator = delegator as? AnyObject {
			_delegator = delegator
		}
	}
	
	deinit {
		print("\(self) is deinit")
	}
}
