//
//  TopHomeView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 21/04/2022.
//

import SwiftUI

// ViewModel ===> View
protocol TopHomeViewModelViewSupport: AnyObject {
	func avatarButtonHandler()
	func settingButtonHandler()
}

struct TopHomeView {
	private init() { }
}

// Properties is used for View
extension TopHomeView {
	class IPros: DefaultIPros<TopHomeViewModelViewSupport>, ObservableObject {
		func avatarButtonHandler() {
			indViewModel?.avatarButtonHandler()
		}
		
		func settingButtonHandler() {
			indViewModel?.settingButtonHandler()
		}
	}
}

// MARK: - ================================= View Layout =================================
extension TopHomeView {
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
//struct TopHomeView_Previews: PreviewProvider {
//	static var previews: some View {
//		TopHomeView(touchedAvatar: .constant(false), touchedSetting: .constant(false))
//	}
//}
#endif
