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
	
	// We need to invalidate all referrence after scene was dissaped if not we got leak
	final func invalidate() {
		if preventInvalidated {
			return preventInvalidated = false
		}
		
		indViewModel = nil
		print("\(self) [<<] invalidated")
	}
	
	final func preventInvalidateModel(completion: () -> Void) {
		preventInvalidated = true
		return completion()
	}
	
	deinit {
		print("\(self) is deinit")
	}
}
