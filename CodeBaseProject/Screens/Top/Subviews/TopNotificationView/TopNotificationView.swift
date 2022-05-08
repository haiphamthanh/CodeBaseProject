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
	class IProps: DefaultIProps<TopNotificationViewModelViewSupport>, ObservableObject {
	}
}

// MARK: - ================================= View Layout =================================
extension TopNotificationView {
	struct IView: View, ViewRule {
		// MARK: Properties
		@ObservedObject var props: IProps
		
		// MARK: Layout
		var body: some View {
			VStack {
				LinkedInTemplate()
			}
		}
	}
}


#if DEBUG
struct TopNotificationView_Previews: PreviewProvider {
	static var previews: some View {
		let viewModel = TopViewModelImpl()
		let props = TopNotificationView.IProps(viewModel: viewModel)
		AnyView(TopNotificationView.IView(props: props))
	}
}
#endif
