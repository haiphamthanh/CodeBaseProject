//
//  String+.swift
//  TBVCommunity
//
//  Created by Apple on 7/12/21.
//

import SwiftUI

extension String {
    func toDate() -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = Date.serverFormat
        formatter.calendar = Date.calendar
        return formatter.date(from: self)
    }
    
    func toForceDate() -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = Date.serverFormat
        formatter.calendar = Date.calendar
        return formatter.date(from: self) ?? Date()
    }
    
    var hasData: Bool {
        return !isEmpty
    }
    
    var isInt: Bool {
        return Int(self) != nil
    }
}

// MARK: - VALIDATION
// https://stackoverflow.com/questions/39284607/how-to-implement-a-regex-for-password-validation-in-swift
extension String {
    /// Email with format Abc@xyz.com
    /// - Returns: is valid or not
    func isValidPassword() -> Bool {
        let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$&*])[A-Za-z\\dd$@$!%*?&#]{8,}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return emailPred.evaluate(with: self)
    }
    
    /// Minimum 8 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet, 1 Number and 1 Special Character:
    /// - Returns: is valid or not
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]{2,64}+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}

extension String {
    var dictionaryFromJSONString: AnyObject? {
        guard let data = self.data(using: String.Encoding.utf8, allowLossyConversion: false) else {
            return nil
        }
        
        return try! JSONSerialization.jsonObject(with: data, options: .mutableContainers) as AnyObject
    }
}


extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
