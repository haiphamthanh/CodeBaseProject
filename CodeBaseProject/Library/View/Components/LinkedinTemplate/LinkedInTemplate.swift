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
					LinkedinStory()
				   
					
					ForEach(getUserPost()) { post in
						PostView(postImageName: post.imageName)
					}.padding(.top)
					Spacer(minLength: 70)
				}
			}
		}
	}
}
