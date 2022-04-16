//
//  ContainerView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 17/04/2022.
//

//import SwiftUI
//
//struct ContainerView: View {
//	
//	var body: some View {
//		VStack {
//			viewModel.currentView()
//			navigationLink()
//		}.onReceive(viewModel.getViewActionPublisher()) { action in
//			if case .dismiss = action {
//				presentationMode.wrappedValue.dismiss()
//			}
//		}
//	}
//	
//	// MARK: - Private
//	
////	@State private var showSheet = false
////
////	private func navigationLink() -> some View {
////		let newContainer = viewModel.nextView()
////		return NavigationLink(destination: newContainer, isActive: $viewModel.enableNavigationLink){}
////	}
//}
//
//struct ContainerView_Previews: PreviewProvider {
//	static var previews: some View {
//		ContainerView(viewModel: mockViewModel)
//	}
//}
