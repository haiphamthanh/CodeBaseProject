//
//  TextShimmer.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 25/03/2022.
//

import SwiftUI

struct FillAllView: View {
	@State var viewInput: FillAllInput
	
	var body: some View {
		GeometryReader { proxy in
			viewInput.color.frame(width: proxy.size.width * 1.3).fixedSize()
		}
	}
}
