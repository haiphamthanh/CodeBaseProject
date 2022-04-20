//
//  Migration+View.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 08/04/2022.
//

import SwiftUI

class UIKitAdapter<Content>: UIHostingController<Content> where Content : View {
	override func viewDidLoad() {
		super.viewDidLoad()
		
		print("View did load")
	}
}
