//
//  ItemDetailView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 08/04/2022.
//

import SwiftUI

// ViewModel ===> View
protocol ItemDetailViewModelViewSupport {
	func gotoSomeWhere()
}

struct ItemDetailView {
	private init() { }
}

// Properties is used for View
extension ItemDetailView {
	class IPros: DefaultIPros<ItemDetailViewModelViewSupport>, ObservableObject {
		func gotoSomeWhere() {
			indViewModel?.gotoSomeWhere()
		}
	}
}

// MARK: - ================================= View Layout =================================
extension ItemDetailView {
	struct IView: View, ViewRule {
		// MARK: Properties
		@ObservedObject var pros: IPros
		
		// MARK: Layout
		var body: some View {
			VStack {
				Text("Detail View")
				Button("Go to some where") {
					pros.gotoSomeWhere()
				}
				.frame(minWidth: 280, maxWidth: 400, idealHeight: 35, alignment: .leading)
				.background(Color.red)
			}
			.toolbar {
				ToolbarItem(placement: .principal) {
					HStack {
						Image(systemName: "sun.min.fill")
						Text("Title").font(.headline)
					}
				}
			}
			.onDisappear {
				self.pros.invalidate()     // << here !!
			}
		}
	}
}
