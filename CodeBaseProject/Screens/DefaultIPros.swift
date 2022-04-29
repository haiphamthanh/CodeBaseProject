//
//  DefaultIPros.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 17/04/2022.
//

import Foundation

class DefaultIPros<IndividualViewModel> {
	private(set) var indViewModel: IndividualViewModel?
	private(set) var preventInvalidated = false
	
	init(viewModel: ViewModelRule) {
		guard let indViewModel = viewModel as? IndividualViewModel else {
			fatalError("View model need to support \(IndividualViewModel.self)")
		}
		
		self.indViewModel = indViewModel
	}
	
	deinit {
		print("\(self) is deinit")
	}
}

extension DefaultIPros {
	// We need to invalidate all referrence after scene was dissaped if not we got leak
	func invalidate() {
		if preventInvalidated {
			return preventInvalidated = false
		}
		
		indViewModel = nil
		print("\(self) [<<] invalidated")
	}
	
	func preventInvalidateModel(completion: () -> Void) {
		preventInvalidated = true
		return completion()
	}
	
	var ruleViewModel: ViewModelRule {
		return indViewModel as! ViewModelRule
	}
}
