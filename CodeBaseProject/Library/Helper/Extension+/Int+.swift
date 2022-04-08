//
//  Int+.swift
//  TBVCommunity
//
//  Created by Apple on 9/15/21.
//

import Foundation

extension Int {
    var doubleValue: Double {
        return Double(self)
    }
    
    init?(doubleVal: Double) {
        guard (doubleVal <= Double(Int.max).nextDown) && (doubleVal >= Double(Int.min).nextUp) else {
            return nil
        }
        
        self.init(doubleVal)
    }
}

extension Int {
    func percent(of sum: Int = 100) -> String {
        guard sum > 0 else {
            return "0%"
        }
		
        let percent = self.doubleValue / sum.doubleValue * 100
        return "\(String(format: "%.0f", percent))%"
    }
}
