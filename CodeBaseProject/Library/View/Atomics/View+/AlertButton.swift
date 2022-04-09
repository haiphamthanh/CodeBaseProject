//
//  AlertButton.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 09/04/2022.
//

import PopupDialog

enum AlertButton: Int {
	case normal = 0
	case cancel
	case destructive
	case other
	
	func button(title: String, action: (() -> Void)? = nil) -> PopupDialogButton {
		switch self {
		case .normal:
			return normalButton(title: title, action: action)
		case .cancel:
			return cancelButton(title: title, action: action)
		case .destructive:
			return destructiveButton(title: title, action: action)
		default:
			return otherButton(title: title, action: action)
		}
	}
}

// MARK: - ================================= Private =================================
private extension AlertButton {
	func normalButton(title: String, action: (() -> Void)?) -> PopupDialogButton {
		let button = DefaultButton(title: title, action: action)
		button.buttonColor = FlatColor.Violet.Violet
		button.titleColor = UIColor.white
		
		return button
	}
	
	func cancelButton(title: String, action: (() -> Void)?) -> PopupDialogButton {
		return CancelButton(title: title, action: action)
	}
	
	func destructiveButton(title: String, action: (() -> Void)?) -> PopupDialogButton {
		return DestructiveButton(title: title, action: action)
	}
	
	func otherButton(title: String, action: (() -> Void)?) -> PopupDialogButton {
		return DefaultButton(title: title, action: action)
	}
	
	func normalButton(title: String, image: UIImage, font: UIFont, color: UIColor, action: (() -> Void)?) -> PopupDialogButton {
		let padding = CGFloat(10.0)
		
		let button = DefaultButton(title: title, action: action)
		button.setTitle(title, for: .normal)
		button.setImage(image, for: .normal)
		
		button.titleEdgeInsets = UIEdgeInsets(top: 0, left: padding,
											  bottom: 0, right: -padding)
		button.contentEdgeInsets = UIEdgeInsets(top: padding, left: 0,
												bottom: padding, right: 0)
		button.titleFont = font
		button.titleColor = color
		
		return button
	}
}
