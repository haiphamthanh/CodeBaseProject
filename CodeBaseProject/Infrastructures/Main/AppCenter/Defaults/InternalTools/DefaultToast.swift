//
//  DefaultToast.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 09/04/2022.
//

import Toast
import UIKit

class DefaultToast {
	@Inject private var navigator: NavigationProvider
	
	deinit {
		print("\(self) deinit")
	}
}

extension DefaultToast: ToastProvider {
	// MARK: - ================================= Usage =================================
	func show(message: String) {
		navigator.topVC?.view.makeToast(message)
	}
	
	func show(message: String, position: MyToastPosition) {
		switch position {
		case .top:
			//TODO: Support later
			break
		case .left:
			//TODO: Support later
			break
		case .right:
			//TODO: Support later
			break
		case .bottom:
			//TODO: Support later
			break
		case .center:
			//TODO: Support later
			break
		}
		
		navigator.topVC?.view.makeToast(message)
	}
	
	func makeToastActivity(_ position: MyToastPosition) {
		var toastPosition = ToastPosition.center
		switch position {
		case .top:
			toastPosition = .top
		case .left:
			//TODO: Support later
			break
		case .right:
			//TODO: Support later
			break
		case .bottom:
			toastPosition = .bottom
		case .center:
			toastPosition = .center
		}
		
		navigator.topVC?.view.makeToastActivity(toastPosition)
	}
	
	func makeToastActivity(_ point: CGPoint) {
		navigator.topVC?.view.makeToastActivity(point)
	}
}
