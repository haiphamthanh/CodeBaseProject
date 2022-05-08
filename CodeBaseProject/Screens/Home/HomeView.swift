//
//  HomeView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 25/03/2022.
//

// TODO: Use custom view https://www.youtube.com/watch?v=YyRBo3lARKo

import SwiftUI

// ViewModel ===> View
protocol HomeViewModelViewSupport: AnyObject {
	func gotoSomeWhere()
}

struct HomeView {
	private init() { }
}

// Properties is used for View
extension HomeView {
	class IProps: DefaultIProps<HomeViewModelViewSupport>, ObservableObject {
		func gotoSomeWhere() {
			indViewModel?.gotoSomeWhere()
		}
	}
}

// MARK: - ================================= View Layout =================================
extension HomeView {
	struct IView: View, ViewRule {
		// MARK: Properties
		@ObservedObject var props: IProps
		
		// MARK: Layout
		var body: some View {
			VStack {
				Text("Home view")
				Button("Go to some where") {
					props.gotoSomeWhere()
				}
				.frame(minWidth: 280, maxWidth: 400, idealHeight: 35, alignment: .leading)
				.background(Color.red)
			}.onDisappear {
				self.props.invalidate()     // << here !!
			}
		}
	}
}
