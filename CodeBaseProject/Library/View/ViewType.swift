//
//  ViewType.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 04/04/2022.
//

import Foundation

enum ViewType {
	enum `ScrollType` {
		case horizontal
		case vertical
	}
	
	case single
	case scroll(type: ScrollType)
}
