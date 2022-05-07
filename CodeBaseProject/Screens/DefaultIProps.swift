//
//  DefaultIProps.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 17/04/2022.
//

import Foundation

class DefaultIProps<IndividualViewModel> {
	private(set) var viewModel: ViewModelRule?
	var indViewModel: IndividualViewModel? {
		return viewModel as? IndividualViewModel
	}
	
	init(viewModel: ViewModelRule) {
		self.viewModel = viewModel
	}
	
	// We need to invalidate all referrence after scene was dissaped if not we got leak
	func invalidate() {
		if AppCenter.Manager
			.modelId
			.isLeafNode(id: viewModel!.id) {
			viewModel = nil
			print("\(self) [<<] invalidated")
		}
	}
	
	deinit {
		print("\(self) is deinit")
	}
}
