//
//  HasRootNavigationController.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 11/04/2022.
//

import SwiftUI
import UIKit

protocol HasRootNavigationController {
	var rootVC:UINavigationController? { get }
	
	func push<Content:View>(view: Content, animated:Bool)
	func setRootNavigation<Content:View>(views:[Content], animated:Bool)
	func pop(animated: Bool)
	func popToRoot(animated: Bool)
}

extension HasRootNavigationController where Self: View {
	var rootVC: UINavigationController? {
		guard let scene = UIApplication.shared.connectedScenes.first,
			let sceneDelegate = scene as? UIWindowScene,
			let rootvc = sceneDelegate.windows.first?.rootViewController
				as? UINavigationController else { return nil }
		return rootvc
	}
	
	func push<Content:View>(view: Content, animated:Bool = true) {
		rootVC?.pushViewController(UIHostingController(rootView: view), animated: animated)
	}
	
	func setRootNavigation<Content:View>(views: [Content], animated:Bool = true) {
		let controllers =  views.compactMap { UIHostingController(rootView: $0) }
		rootVC?.setViewControllers(controllers, animated: animated)
	}
	
	func pop(animated:Bool = true) {
		rootVC?.popViewController(animated: animated)
	}
	
	func popToRoot(animated: Bool = true) {
		rootVC?.popToRootViewController(animated: animated)
	}
}
