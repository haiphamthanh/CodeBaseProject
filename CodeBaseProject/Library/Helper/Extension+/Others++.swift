//
//  Others++.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 15/04/2022.
//

import Foundation

// Use for one target
func strongify<Context: AnyObject, Arguments>(_ context: Context?, closure: @escaping (Context, Arguments) -> Void) -> (Arguments) -> Void {
	return { [weak context] arguments in
		guard let strongContext = context else { return }
		closure(strongContext, arguments)
	}
}
