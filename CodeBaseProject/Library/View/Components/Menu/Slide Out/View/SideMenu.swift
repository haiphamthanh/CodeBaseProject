//
//  SideMenu.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 20/04/2022.
//

/// https://www.youtube.com/watch?v=0HEYo3QRDfA

import SwiftUI

struct SideMenu: View {
	@Binding var showMenu: Bool
	
    var body: some View {
		VStack(alignment: .leading, spacing: 0) {
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
			.padding(.horizontal)
			.padding(.leading)
			.padding(.bottom)
			
			ScrollView(.vertical, showsIndicators: false) {
				VStack(alignment: .leading, spacing: 45) {
					// Tab buttons
					TabButton(title: "Home", image: "ic_home")
					TabButton(title: "Camera", image: "ic_camera")
					TabButton(title: "Cart", image: "ic_cart")
					TabButton(title: "Setting", image: "ic_setting")
					TabButton(title: "Home", image: "ic_home")
					TabButton(title: "Camera", image: "ic_camera")
					TabButton(title: "Cart", image: "ic_cart")
					TabButton(title: "Setting", image: "ic_setting")
				}
				.padding()
				.padding(.leading)
				.padding(.top, 45)
				
				Divider()
				
				TabButton(title: "Facebook", image: "ic_facebook")
					.padding()
					.padding(.leading)
				
				Divider()
				
				VStack(alignment: .leading, spacing: 25) {
					Button("Setting And Privacy") {
						
					}
					
					Button("Help Center") {
						
					}
				}
				.padding()
				.padding(.leading)
				.padding(.bottom)
				.frame(maxWidth: .infinity, alignment: .leading)
				.foregroundColor(.primary)
			}
			
			VStack(spacing: 0) {
				
				Divider()
				
				HStack {
					Button {
						
					} label: {
						Image("ic_home")
							.resizable()
							.renderingMode(.template)
							.aspectRatio(contentMode: .fill)
							.frame(width: 22, height: 22)
					}
					
					Spacer()
					
					Button {
						
					} label: {
						Image("ic_setting")
							.resizable()
							.renderingMode(.template)
							.aspectRatio(contentMode: .fill)
							.frame(width: 22, height: 22)
					}
				}
				.padding([.horizontal, .top], 15)
				.foregroundColor(.primary)
			}
		}
		.padding(.top)
		.frame(maxWidth: .infinity, alignment: .leading)
		// Max width
		.frame(width: currentRect().width - 90) // Lấy chiều ngang hiện tại trừ đi 90
		.frame(maxHeight: .infinity) // Để full màn hình mà không cần quan tâm tới các kích thước của thiết bị khác nhau. Thì ta sử dụng tham số .infinity
		.background(
			Color.primary
				.opacity(0.04) // Làm màu nhạt đi
				.ignoresSafeArea(.container, edges: .vertical) // Kéo dãn view màu đỏ lên trên cùng và xuống dưới cùng
		)
		.frame(maxWidth: .infinity, alignment: .leading) // Canh trái view
    }
	
	@ViewBuilder
	func TabButton(title: String, image: String) -> some View {
		NavigationLink {
			Text("\(title) View")
				.navigationTitle(title)
		} label: {
			HStack(spacing: 14) {
				Image(image)
					.resizable()
					.renderingMode(.template)
					.aspectRatio(contentMode: .fill)
					.frame(width: 22, height: 22)
				Text(title)
			}
			.foregroundColor(.primary)
			.frame(maxWidth: .infinity, alignment: .leading)
		}
	}
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SlideOutMenu()
    }
}


// 2. Extending View to get Screen Rect...
extension View {
	func currentRect() -> CGRect {
		return UIScreen.main.bounds
	}
}
