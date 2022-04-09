//
//  AlertServiceProtocol.swift
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

protocol AlertServiceProtocol {
	var state: AlertState { get }
	
	// Action
	func show(_ input: AlertInput)
	func forceDismiss()
}

class AlertService {
	// MARK: - ================================= Properties =================================
	@Published var state: AlertState = .dismiss
	private let navigationService: BasicNavigationServiceProtocol
	
	// MARK: - ================================= Init =================================
	init(navigationService: BasicNavigationServiceProtocol) {
		self.navigationService = navigationService
	}
	
	deinit {
		print("\(self) deinit")
	}
}

// MARK: - ================================= Public actions =================================
extension AlertService: AlertServiceProtocol {
	func show(_ input: AlertInput) {
		let title = input.title
		let message = input.message
		let buttonAlignment = input.buttonAlignment
		let transitionStyle = input.transitionStyle
		let gestureDismissal = input.gestureDismissal
		let panGestureDismissal = input.panGestureDismissal
		let doneButton = (input.doneButton ?? .normal)
			.button(title: "Keyboard.Button.OK")
		
		let popup = PopupDialog(title: title,
								message: message,
								buttonAlignment: buttonAlignment,
								transitionStyle: transitionStyle,
								preferredWidth: 100,
								tapGestureDismissal: gestureDismissal,
								panGestureDismissal: panGestureDismissal,
								hideStatusBar: true) { [weak self] in
									self?.didDismiss()
		}
		popup.addButton(doneButton)
		
		// Present dialog
		navigationService.present(viewController: popup, animated: true, completion: nil)
		return state = .show
	}
	
	func forceDismiss() {
		navigationService.dismiss(animated: true) { [weak self] in
			self?.didDismiss()
		}
	}
}

private extension AlertService {
	func didDismiss() {
		state = .dismiss
	}
}
