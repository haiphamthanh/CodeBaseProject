//
//  OtherType.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 23/04/2022.
//

import Foundation

enum OtherType {
	case setting
	case none
	
	var info: (image: String?, name: String)? {
		switch self {
		case .setting:
			return (image: "ic_setting", name: "Setting")
		case .none:
			return nil
		}
	}
}

