//
//  LinkedInTemplate.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 03/05/2022.
//

import SwiftUI

struct LinkedInTemplate: View {
	var body: some View {
		ZStack {
			Color.white.edgesIgnoringSafeArea(.all)
			VStack {
				SearchView()
				
				ScrollView(.vertical, showsIndicators: false) {
					let adPlacement: Int = 5
					LinkedinStory()
					
					let userPosts = getUserPost()
					let number = userPosts.count
					ForEach(0..<number, id:\.self) { index in
						let post = userPosts[index]
						PostView(postImageName: post.imageName)
						
						// Add sample ad
						if (index % adPlacement) == 0 {
							Button {
								GoogleAdProvider.showInterstitial(with: "ca-app-pub-3940256099942544/4411468910")
							} label: {
								Text("Tap to show Interstitial Ad")
							}
							GoogleAdProvider.banner(with: "ca-app-pub-3940256099942544/2934735716")
						}
					}.padding(.top)
					
					Spacer(minLength: 70)
				}
			}
		}
	}
}
