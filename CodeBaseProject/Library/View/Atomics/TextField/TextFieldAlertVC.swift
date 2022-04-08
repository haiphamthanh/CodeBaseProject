//
//  TextFieldAlertVC.swift
//  TBVCommunity
//
//  Created by HaiKaito on 14/07/2021.
// https://www.youtube.com/watch?v=KYokxl1inRs
// https://betterprogramming.pub/creating-an-apple-like-splash-screen-in-swiftui-fdeb36b47e81
// https://mobiraft.com/ios/swiftui/how-to-add-splash-screen-in-swiftui/
//

import SwiftUI
import Combine

struct AlertWrapper:  UIViewControllerRepresentable {
	
	@Binding var isPresented: Bool
	let alert: TextFieldAlert
	
	typealias UIViewControllerType = TextFieldAlertVC
	
	func makeUIViewController(context: UIViewControllerRepresentableContext<AlertWrapper>) -> UIViewControllerType {
		TextFieldAlertVC(isPresented: $isPresented, alert: alert)
	}
	
	func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<AlertWrapper>) {
		// no update needed
	}
}

struct TextFieldWrapper<PresentingView: View>: View {
	
	@Binding var isPresented: Bool
	let presentingView: PresentingView
	let content: TextFieldAlert
	
	
	var body: some View {
		ZStack {
			if (isPresented) {
				AlertWrapper(isPresented: $isPresented, alert: content)
			}
			presentingView
		}
	}
}

class TextFieldAlertVC: UIViewController, UITextFieldDelegate {
	init(isPresented: Binding<Bool>, alert: TextFieldAlert) {
		self._isPresented = isPresented
		self.alert = alert
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	weak var actionToEnable : UIAlertAction?
	
	@Binding
	private var isPresented: Bool
	private var alert: TextFieldAlert
	
	// MARK: - Private Properties
	private var subscription: AnyCancellable?
	
	// MARK: - Lifecycle
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		presentAlertController()
	}
	
	private func presentAlertController() {
		guard subscription == nil else { return }
		
		let vc = UIAlertController(title: alert.title, message: alert.message, preferredStyle: .alert)
		vc.addTextField {
			$0.font = UIFont.systemFont(ofSize: 16)
			$0.text = self.alert.defaultText
			$0.placeholder = self.alert.placeHolderText
			$0.addTarget(self, action: #selector(TextFieldAlertVC.textChanged(_:)), for: .editingChanged)
		}
		if let cancel = alert.cancel {
			vc.addAction(UIAlertAction(title: cancel, style: .cancel) { _ in
				self.isPresented = false
			})
		}
		let textField = vc.textFields?.first
		let action = UIAlertAction(title: alert.accept, style: .default) { _ in
			self.isPresented = false
			self.alert.action(textField?.text)
		}
		self.actionToEnable = action
		action.isEnabled = false
		vc.addAction(action)
		present(vc, animated: true, completion: nil)
	}
	
	@objc func textChanged(_ sender: UITextField) {
		self.actionToEnable?.isEnabled = sender.text?.hasData ?? false
	}
}
