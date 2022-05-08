//
//  ProfileView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 22/04/2022.
//

import SwiftUI

struct ProfileView: View {
	var body: some View {
		VStack(alignment: .leading, spacing: 14) {
			Image("img_my_avatar")
				.resizable()
				.aspectRatio(contentMode: .fill)
				.frame(width: 65, height: 65)
				.clipShape(Circle())
			
			Text("Hai Kaito")
				.font(.title2.bold())
			
			Text("@haipham")
				.font(.callout)
			
			HStack(spacing: 12) {
				Button {
					
				} label: {
					Label {
						Text("Followers")
					} icon: {
						Text("1967")
							.fontWeight(.bold)
					}
				}
				
				Button {
					
				} label: {
					Label {
						Text("Following")
					} icon: {
						Text("1.2M")
							.fontWeight(.bold)
					}
				}
			}
			.foregroundColor(.primary)
		}
	}
}

struct ProfileView_Previews: PreviewProvider {
	static var previews: some View {
		ProfileView()
	}
}
