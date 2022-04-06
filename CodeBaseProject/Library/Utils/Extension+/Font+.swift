//
//  Font+.swift
//  TBVCommunity
//
//  Created by Apple on 7/12/21.
//

import Foundation
import UIKit
import SwiftUI

extension Font {
    static func customFont(size: CGFloat = 17, weight: Font.Weight = .light) -> Font {
        return Font.system(size: size, weight: weight) //.custom("HiraMaruProN", size: size).weight(weight)
    }
}
