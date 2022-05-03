//
//  TopVideoView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 22/04/2022.
//

import SwiftUI

// ViewModel ===> View
protocol TopVideoViewModelViewSupport: AnyObject {
}

struct TopVideoView {
	private init() { }
}

// Properties is used for View
extension TopVideoView {
	class IPros: DefaultIPros<TopVideoViewModelViewSupport>, ObservableObject {
	}
}

// MARK: - ================================= View Layout =================================
extension TopVideoView {
	struct IView: View, ViewRule {
		// MARK: Properties
		@ObservedObject var pros: IPros
		
		// MARK: Layout
		var body: some View {
			VStack {
				Text(TabbarType.video.info.name)
				Spacer()
			}
		}
	}
}


#if DEBUG
struct TopVideoView_Previews: PreviewProvider {
	static var previews: some View {
		let viewModel = TopViewModelImpl()
		let props = TopVideoView.IPros(viewModel: viewModel)
		AnyView(TopVideoView.IView(pros: props))
	}
}
#endif
