//
//  TopNotificationView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 22/04/2022.
//

import SwiftUI

// ViewModel ===> View
protocol TopNotificationViewModelViewSupport: AnyObject {
}

struct TopNotificationView {
	private init() { }
}

// Properties is used for View
extension TopNotificationView {
	class IPros: DefaultIPros<TopNotificationViewModelViewSupport>, ObservableObject {
	}
}

// MARK: - ================================= View Layout =================================
extension TopNotificationView {
	struct IView: View, ViewRule {
		// MARK: Properties
		@ObservedObject var pros: IPros
		
		// MARK: Layout
		var body: some View {
			VStack {
				Text(TabbarType.noti.info.name)
				Spacer()
			}
		}
	}
}


#if DEBUG
struct TopNotificationView_Previews: PreviewProvider {
	static var previews: some View {
		let viewModel = TopNotificationViewModelImpl()
		let props = TopNotificationView.IPros(viewModel: viewModel)
		AnyView(TopNotificationView.IView(pros: props))
	}
}
#endif
