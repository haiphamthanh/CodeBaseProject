//
//  TopSearchView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 22/04/2022.
//

import SwiftUI

// ViewModel ===> View
protocol TopSearchViewModelViewSupport: AnyObject {
	func avatarButtonHandler()
	func settingButtonHandler()
}

struct TopSearchView {
	private init() { }
}

// Properties is used for View
extension TopSearchView {
	class IPros: DefaultIPros<TopSearchViewModelViewSupport>, ObservableObject {
		func avatarButtonHandler() {
			indViewModel?.avatarButtonHandler()
		}
		
		func settingButtonHandler() {
			indViewModel?.settingButtonHandler()
		}
	}
}

// MARK: - ================================= View Layout =================================
extension TopSearchView {
	struct IView: View, ViewRule {
		// MARK: Properties
		@ObservedObject var pros: IPros
		@State private var touchedAvatar: Bool = false
		@State private var touchedSetting: Bool = false
		
		// MARK: Layout
		var body: some View {
			VStack {
				ExNavigationBarView(touchedAvatar: $touchedAvatar.onUpdate(avatarButtonHandler),
									touchedSetting: $touchedSetting.onUpdate(settingButtonHandler))
				
				Spacer()
			}
		}
		
		private func avatarButtonHandler(_ isTouched: Bool) {
			pros.avatarButtonHandler()
		}
		
		private func settingButtonHandler(_ isTouched: Bool) {
			pros.settingButtonHandler()
		}
	}
}


#if DEBUG
struct TopSearchView_Previews: PreviewProvider {
	static var previews: some View {
		let viewModel = TopSearchViewModelImpl()
		let props = TopSearchView.IPros(viewModel: viewModel)
		AnyView(TopSearchView.IView(pros: props))
	}
}
#endif
