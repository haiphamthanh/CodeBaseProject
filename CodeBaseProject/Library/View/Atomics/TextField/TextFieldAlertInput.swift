//
//  TextFieldAlertInput.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 04/04/2022.
//

import Foundation

struct TextFieldAlert {
	let title: String
	let message: String?
	var defaultText: String = ""
	var placeHolderText: String = ""
	public var accept: String = "OK"
	public var cancel: String? = "Cancel"
	public var action: (String?) -> Void
}
