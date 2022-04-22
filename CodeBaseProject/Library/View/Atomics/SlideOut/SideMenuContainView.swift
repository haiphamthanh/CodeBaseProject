//
//  SideMenuContainView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 20/04/2022.
//

/// https://www.youtube.com/watch?v=0HEYo3QRDfA

import SwiftUI

// TODO: Move to common
let Menu_Background_Color = Color.primary.opacity(0.04)

struct SideMenuContainView: View {
	let sideBarWidth: CGFloat
	@Binding var showMenu: Bool
	
	var body: some View {
		VStack(alignment: .leading, spacing: 0) {
			MenuHeader()
			.padding(.horizontal)
			.padding(.leading)
			.padding(.bottom)
			
			MenuContainView()
			
			MenuFooter()
		}
		.padding(.top)
		.frame(maxWidth: .infinity, alignment: .leading)
		// Max width
		.frame(width: sideBarWidth)
		// Để full màn hình mà không cần quan tâm tới các kích thước của thiết bị khác nhau. Thì ta sử dụng tham số .infinity
		.frame(maxHeight: .infinity)
		.background(
			// Kéo dãn view bỏ đi các edges theo chiều dọc (vertical)
			Menu_Background_Color.ignoresSafeArea(.container, edges: .vertical)
		)
		.frame(maxWidth: .infinity, alignment: .leading) // Canh trái view
	}
}

struct SideMenuContainView_Previews: PreviewProvider {
	static var previews: some View {
		SlideOutMenu()
	}
}
