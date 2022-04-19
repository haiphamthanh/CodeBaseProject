//
//  IntroView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 08/04/2022.
//

import SwiftUI

// ViewModel ===> View
protocol IntroViewModelViewSupport {
	func gotoSomeWhere()
}

struct IntroView {
	private init() { }
	
	// Properties is used for View
	class IPros: DefaultIPros<IntroViewModelViewSupport>, ObservableObject {
		func gotoSomeWhere() {
			indViewModel?.gotoSomeWhere()
		}
	}
	
	// MARK: - ================================= View Layout =================================
	struct IView: View, ViewRule {
		// MARK: Properties
		@ObservedObject var pros: IPros
		
		// MARK: Layout
		var body: some View {
			VStack {
				Text("Intro view")
				Button("Go to Home") {
					pros.gotoSomeWhere()
				}
				.frame(minWidth: 280, maxWidth: 400, idealHeight: 35, alignment: .leading)
				.background(Color.red)
			}.onDisappear {
				self.pros.invalidate()     // << here !!
			}
		}
	}
}
