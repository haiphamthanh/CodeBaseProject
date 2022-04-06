//
//  SingleViewInput.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 04/04/2022.
//

import Foundation

class SingleViewInput: ObservableObject {
	let identifier = UUID() // A unique identifier that never changes.
	
	@Published var title = "Great Expectations"
}
