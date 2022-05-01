//
//  MenuContainView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 22/04/2022.
//

import SwiftUI

struct MenuContainView: View {
	@Binding var output: MenuType
	
	var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			VStack(alignment: .leading, spacing: 45) {
				// Tab buttons
				MenuButton(MenuType.home)
				MenuButton(MenuType.search)
				MenuButton(MenuType.noti)
				MenuButton(MenuType.video)
			}
			.padding()
			.padding(.leading)
			.padding(.top, 45)
			
			Divider()
			
			MenuButton(MenuType.facebook)
				.padding()
				.padding(.leading)
			
			Divider()
			
			VStack(alignment: .leading, spacing: 25) {
				MenuButton(MenuType.privacy)
				
				MenuButton(MenuType.help)
			}
			.padding()
			.padding(.leading)
			.padding(.bottom)
			.frame(maxWidth: .infinity, alignment: .leading)
			.foregroundColor(.primary)
		}
	}
}

// MARK: - >>>>>>>>>>>> View Builder
private extension MenuContainView {
	@ViewBuilder
	func MenuButton(_ type: MenuType) -> some View {
		let image = type.info?.image
		let name = type.info?.name
		
		if image != nil || name != nil {
			Button {
				withAnimation{ output = type }
			} label: {
				HStack(spacing: 14) {
					if let image = image {
						Image(image)
							.resizable()
							.renderingMode(.template)
							.aspectRatio(contentMode: .fill)
							.frame(width: 22, height: 22)
					}
					
					if let name = name {
						Text(name)
					}
				}
				.foregroundColor(.primary)
				.frame(maxWidth: .infinity, alignment: .leading)
			}
		}
	}
}

#if DEBUG
struct MenuContainView_Previews: PreviewProvider {
	static var previews: some View {
		MenuContainView(output: .constant(MenuType.none))
	}
}
#endif
