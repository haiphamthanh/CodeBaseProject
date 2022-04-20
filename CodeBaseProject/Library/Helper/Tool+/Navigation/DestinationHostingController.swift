//
//  DestinationHostingController.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 11/04/2022.
//

import SwiftUI

struct NavigationBarTitleConfiguration {
	let title: String
	let displayMode: NavigationBarItem.TitleDisplayMode
}

protocol NavigationUIView {
	var navigationBarTitleConfiguration: NavigationBarTitleConfiguration { get }
}

class NavigationHostingController<T: View>: UIHostingController<T> {
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		let rootMirror = Mirror(reflecting: rootView)
		
		let storageMirror = rootView is AnyView ? rootMirror : Mirror(reflecting: rootMirror.descendant("content")!)
		let navigationTitleConfiguration = extractNavigationTitleConfiguration(storageMirror: storageMirror)
		
		if let navigationTitleConfiguration = navigationTitleConfiguration {
			navigationItem.title = navigationTitleConfiguration.title
			//            navigationItem.largeTitleDisplayMode = navigationTitleConfiguration.displayMode
		}
	}
	
	private func extractNavigationTitleConfiguration(storageMirror: Mirror) -> NavigationBarTitleConfiguration? {
		guard let storage = storageMirror.descendant("storage") else { return nil }
		let storageMirror = Mirror(reflecting: storage)
		
		guard let swiftUIView = storageMirror.descendant("view") else { return nil }
		if let view = swiftUIView as? NavigationUIView {
			return view.navigationBarTitleConfiguration
		}
		
		return nil
	}
}
