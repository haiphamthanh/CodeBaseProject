//
//  SlideOutContainView.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 20/04/2022.
//

/// https://www.youtube.com/watch?v=0HEYo3QRDfA

import SwiftUI

struct SlideOutContainView: View {
	/// Menu handler
	@State private var showMenu: Bool = false
	@State private var currentTab = "Home"
	
	/// Properties to support gesture
	// Offset for both drag gesture and showing menu
	@State private var offset: CGFloat = 0
	@State private var lastStoresOffset: CGFloat = 0
	@GestureState private var gestureOffset: CGFloat = 0
	
	// Hidding native one...
	init() {
		UITabBar.appearance().isHidden = true
	}
	
	var body: some View {
		let currentScreenWidth = currentScreenRect().width
		let sideBarWidth = currentScreenWidth - 90
		
		// Whole navigation view...
		NavigationView {
			HStack(spacing: 0) {
				// Side menu...
				SideMenuView(sideBarWidth: sideBarWidth, showMenu: $showMenu)
				
				// Main tab View
				TabBarContainView(showMenu: $showMenu, currentTab: $currentTab)
					.frame(width: currentScreenWidth)
				// BG when menu is showing...
					.overlay(
						Rectangle()
							.fill(
								Color.primary.opacity(Double(offset / sideBarWidth) / 5)
							)
							.ignoresSafeArea(.container, edges: .vertical)
							.onTapGesture {
								withAnimation {
									showMenu.toggle()
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
			.padding(.bottom, isBottomIndicatorAvailable ? 0 : 10)
//			.padding(.bottom, self.safe safeAreaInsets.bottom > 0 ? 10 : 0)
//			if self.safeAreaInsets.bottom > 0 {
//				.padding(.bottom, 10)
//			}
		}
		.animation(.easeOut, value: offset == 0)
		.onChange(of: showMenu) { _ in
			on(showMenu: showMenu, sideBarWidth: sideBarWidth)
		}
		.onChange(of: gestureOffset) { _ in
			updateOffset(sideBarWidth: sideBarWidth)
		}
	}
}

// MARK: - >>>>>>>>>>>> View Action Handler
private extension SlideOutContainView {
	func on(showMenu: Bool, sideBarWidth: CGFloat) {
		if showMenu && offset == 0 {
			offset = sideBarWidth
			lastStoresOffset = offset
		}
		
		if !showMenu && offset == sideBarWidth {
			offset = 0
			lastStoresOffset = 0
		}
	}
	
	func updateOffset(sideBarWidth: CGFloat) {
		let currentGestureOffset = gestureOffset + lastStoresOffset
		let validMovedOffset = currentGestureOffset >= sideBarWidth ? offset : currentGestureOffset
		return offset = validMovedOffset
	}
	
	func onEnd(gestureValue: DragGesture.Value, sideBarWidth: CGFloat) {
		let transition  = gestureValue.translation.width
		
		withAnimation {
			// Chekcing...
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
			showMenu = true
		} else {
			// Extra case...
			if offset == sideBarWidth {
				return
			}
			
			offset = 0
			showMenu = false
		}
	}
	
	func onEndGestureWithTransitionNegative(_ transition: CGFloat, checker sideBarWidth: CGFloat) {
		if -transition > (sideBarWidth / 2) {
			offset = 0
			showMenu = false
		} else {
			// Extra case...
			if offset == 0 || !showMenu {
				return
			}
			
			offset = sideBarWidth
			showMenu = true
		}
	}
}

struct SlideOutContainView_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			SlideOutContainView()
		}
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
