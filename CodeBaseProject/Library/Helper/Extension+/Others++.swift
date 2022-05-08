//
//  Others++.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 15/04/2022.
//

import SwiftUI

// Use for one target
func strongify<Context: AnyObject, Arguments>(_ context: Context?, closure: @escaping (Context, Arguments) -> Void) -> (Arguments) -> Void {
	return { [weak context] arguments in
		guard let strongContext = context else { return }
		closure(strongContext, arguments)
	}
}

extension Binding {
	
	/// When the `Binding`'s `wrappedValue` changes, the given closure is executed.
	/// - Parameter closure: Chunk of code to execute whenever the value changes.
	/// - Returns: New `Binding`.
	func onUpdate(_ closure: @escaping (Value) -> Void) -> Binding<Value> {
		Binding(get: {
			wrappedValue
		}, set: { newValue in
			wrappedValue = newValue
			closure(wrappedValue)
		})
	}
}
