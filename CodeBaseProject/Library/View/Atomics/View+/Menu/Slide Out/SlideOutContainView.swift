//
//  SlideOutContainView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 20/04/2022.
//

/// https://www.youtube.com/watch?v=0HEYo3QRDfA

import SwiftUI

struct SlideOutContainView<SideMenuContent: View, TabbarContent: View>: ViewModifier {
	/// Menu handler
	@Binding private var isShowingMenu: Bool
	private let sideMenuContent: () -> SideMenuContent
	private let tabbarContent: () -> TabbarContent
	private let showMenuObserved = NotificationCenter.default.publisher(for: AppNotificationData.didOpenMenu)
	private let closeMenuObserved = NotificationCenter.default.publisher(for: AppNotificationData.didCloseMenu)
	
	/// Properties to support gesture
	// Offset for both drag gesture and showing menu
	@State private var offset: CGFloat = 0
	@State private var lastStoresOffset: CGFloat = 0
	@GestureState private var gestureOffset: CGFloat = 0
	
	public init(isShowingMenu: Binding<Bool>,
				@ViewBuilder sideMenuContent: @escaping () -> SideMenuContent,
				@ViewBuilder tabbarContent: @escaping () -> TabbarContent) {
		_isShowingMenu = isShowingMenu
		self.sideMenuContent = sideMenuContent
		self.tabbarContent = tabbarContent
	}
	
	func body(content: Content) -> some View {
		let currentScreenWidth = content.currentScreenRect().width
		let sideBarWidth = currentScreenWidth - 90
		
		// Whole navigation view... NavigationView {
		VStack {
			HStack(spacing: 0) {
				// Side menu...
				sideMenuContent()
				
				// Main tab View
				tabbarContent()
					.frame(width: currentScreenWidth)
				// BG when menu is showing...
					.overlay(
						Rectangle()
							.fill(
								Color.red.opacity(Double(offset / sideBarWidth) / 5)
							)
							.ignoresSafeArea(.container, edges: .vertical)
							.onTapGesture {
								withAnimation {
									isShowingMenu.toggle()
								}
							}
					)
			}
			// max Size...
			.frame(width: currentScreenWidth + sideBarWidth)
			.offset(x: -sideBarWidth / 2)
			.offset(x: offset > 0 ? offset : 0)
			// Gesture...
			.gesture(
				DragGesture()
					.updating($gestureOffset, body: { value, out, _ in
						out = value.translation.width
					})
					.onEnded({ gestureValue in
						onEnd(gestureValue: gestureValue, sideBarWidth: sideBarWidth)
					})
			)
			// No navigation bar title
			// Hidding navigation bar
			.navigationBarTitleDisplayMode(.inline)
			.navigationBarHidden(true)
		}
		.animation(.easeOut, value: offset == 0)
		.onReceive(showMenuObserved) { _ in
			self.isShowingMenu = true
		}
		.onReceive(closeMenuObserved) { _ in
			self.isShowingMenu = false
		}
		.onChange(of: isShowingMenu) { _ in
			onShowingMenu(isShowingMenu, sideBarWidth: sideBarWidth)
		}
		.onChange(of: gestureOffset) { _ in
			updateOffset(limitedWidth: sideBarWidth)
		}
	}
}

// MARK: - >>>>>>>>>>>> View Action Handler
private extension SlideOutContainView {
	func onShowingMenu(_ isShowing: Bool, sideBarWidth: CGFloat) {
		if isShowing && offset == 0 {
			offset = sideBarWidth
			lastStoresOffset = offset
		}
		
		if !isShowing && offset == sideBarWidth {
			offset = 0
			lastStoresOffset = 0
		}
	}
	
	func updateOffset(limitedWidth sideBarWidth: CGFloat) {
		let currentGestureOffset = gestureOffset + lastStoresOffset
		let validMovedOffset = currentGestureOffset >= sideBarWidth ? offset : currentGestureOffset
		return offset = validMovedOffset
	}
	
	func onEnd(gestureValue: DragGesture.Value, sideBarWidth: CGFloat) {
		let transition  = gestureValue.translation.width
		
		withAnimation {
			// Checking...
			if transition > 0 {
				onEndGestureWithTransitionPositive(transition, checker: sideBarWidth)
			} else {
				onEndGestureWithTransitionNegative(transition, checker: sideBarWidth)
			}
		}
		
		// storing lass offser...
		lastStoresOffset = offset
	}
	
	func onEndGestureWithTransitionPositive(_ transition: CGFloat, checker sideBarWidth: CGFloat) {
		if transition > (sideBarWidth / 2) {
			// show menu
			offset = sideBarWidth
			isShowingMenu = true
		} else {
			// Extra case...
			if offset == sideBarWidth {
				return
			}
			
			offset = 0
			isShowingMenu = false
		}
	}
	
	func onEndGestureWithTransitionNegative(_ transition: CGFloat, checker sideBarWidth: CGFloat) {
		if -transition > (sideBarWidth / 2) {
			offset = 0
			isShowingMenu = false
		} else {
			// Extra case...
			if offset == 0 || !isShowingMenu {
				return
			}
			
			offset = sideBarWidth
			isShowingMenu = true
		}
	}
}

// Export to use as utils
extension View {
	func sideMenuWithTabbar<SideMenuContent: View, TabbarContent: View>(
		isShowingMenu: Binding<Bool>,
		@ViewBuilder sideMenuContent: @escaping () -> SideMenuContent,
		@ViewBuilder tabbarContent: @escaping () -> TabbarContent
	) -> some View {
		self.modifier(SlideOutContainView(isShowingMenu: isShowingMenu,
										  sideMenuContent: sideMenuContent,
										  tabbarContent: tabbarContent))
	}
}

/*
 // MARK: - >>>>>>>>>>>> Old
 private extension SlideOutContainView {
 func updateOffsetIfNeeded() {
 let sideBarWidth = currentRect().width - 90
 offset = (gestureOffset != 0) ? (gestureOffset + lastStoresOffset < sideBarWidth ? gestureOffset + lastStoresOffset : offset) : offset
 }
 }
 */

