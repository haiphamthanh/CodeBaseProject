//
//  DefaultAlert.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 09/04/2022.
//

import PopupDialog

class DefaultAlert {
	@Inject private var navigator: NavigationProvider
	@Published var state: AlertState = .dismiss
	
	deinit {
		print("\(self) deinit")
	}
}

// MARK: - ================================= Public actions =================================
extension DefaultAlert: AlertProvider {
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
		navigator.present(viewController: popup, animated: true, completion: nil)
		return state = .show
	}
	
	func forceDismiss() {
		navigator.dismiss(animated: true) { [weak self] in
			self?.didDismiss()
		}
	}
}

private extension DefaultAlert {
	func didDismiss() {
		state = .dismiss
	}
}
