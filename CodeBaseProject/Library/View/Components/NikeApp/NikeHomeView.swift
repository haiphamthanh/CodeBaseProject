//
//  NikeAppApp.swift
//  NikeApp
//
//  Created by recherst on 2021/10/3.
//

import SwiftUI

protocol NikeHomeViewDelegate: AnyObject {
	func addToCart(_ isAdded: Bool)
}

struct NikeHomeView {
	private init() { }
}

// Properties is used for View
extension NikeHomeView {
	class IPros: DefaultComponentIPros<NikeHomeViewDelegate>, ObservableObject {
		func addToCart(_ isAdded: Bool) {
			delegator?.addToCart(isAdded)
		}
	}
}

// MARK: - ================================= View Layout =================================
extension NikeHomeView {
	struct IView: View, ViewRule {
		// MARK: Properties
		@ObservedObject var pros: IPros
		@State private var added: Bool = false
		
		// MARK: Layout
		var body: some View {
			NikeHome(added: $added.onUpdate({ added in
				pros.addToCart(added)
			}))
		}
	}
}

struct NikeHomeView_Previews: PreviewProvider {
	static var previews: some View {
		NikeHomeView.IView(pros: NikeHomeView.IPros(delegator: nil))
	}
}
