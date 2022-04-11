//
//  AppNavigatorProvider.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 11/04/2022.
//

import SwiftUI

protocol AppNavigatorProvider {
	// Support SwiftUI only
	func pushView(_ view: AnyView, animated: Bool)
	func popToRoot(animated: Bool, completion: @escaping () -> Void)
	func popToRootAndPushToView(_ view: AnyView, animated: Bool)
	func popToPrevious(animated: Bool, completion: @escaping () -> Void)
	
	// Support SwiftUI and UIKit
	func pushViewController(_ viewController: UIViewController, animated: Bool)
	func popToRootViewController(animated: Bool, completion: @escaping () -> Void)
	func popViewController(animated: Bool, completion: @escaping () -> Void)
	func switchRootViewController(rootViewController: UIViewController, animated: Bool, completion: (() -> Void)?)
}
