//
//  AlertProvider.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 09/04/2022.
//

import PopupDialog

struct AlertInput {
	let title: String?
	let message: String
	let buttonAlignment: NSLayoutConstraint.Axis
	let transitionStyle: PopupDialogTransitionStyle
	let gestureDismissal: Bool
	let panGestureDismissal: Bool
	let doneButton: AlertButton?
	
	init(title: String? = nil,
		 message: String,
		 buttonAlignment: NSLayoutConstraint.Axis = .horizontal,
		 transitionStyle: PopupDialogTransitionStyle = .zoomIn,
		 gestureDismissal: Bool = true,
		 panGestureDismissal: Bool = true,
		 doneButton: AlertButton? = .normal) {
		self.title = title
		self.message = message
		self.buttonAlignment = buttonAlignment
		self.transitionStyle = transitionStyle
		self.gestureDismissal = gestureDismissal
		self.panGestureDismissal = panGestureDismissal
		self.doneButton = doneButton
	}
}

enum AlertState {
	case show
	case cancel
	case dismiss
}

protocol AlertProvider {
	var state: AlertState { get }
	
	// Action
	func show(_ input: AlertInput)
	func forceDismiss()
}
