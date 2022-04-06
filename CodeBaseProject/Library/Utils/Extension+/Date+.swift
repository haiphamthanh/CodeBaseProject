//
//  Date+.swift
//  TBVCommunity
//
//  Created by HaiKaito on 06/07/2021.
//

import Foundation
import UIKit

extension Date {
    static var serverFormat: String {
        return "yyyy/MM/dd"
    }
    
	/// User’s current calendar.
    static public var calendar: Calendar {
        let calendar = Calendar.current
//        calendar.locale = NSLocale(localeIdentifier: "vi_VI") as Locale
		return calendar
	}
	
	/// Check if date is in past.
	var isInPastTime: Bool {
		return self < Date()
	}

    var isInPastDay: Bool {
        return compareDay(from: Date(), calendar: Date.calendar) == .orderedAscending
    }
    
    var isInShowingPeriodDay: Bool {
        return compareDay(from: Date().toServerDateString.toDate() ?? Date(), calendar: Date.calendar).rawValue > ComparisonResult.orderedAscending.rawValue
    }
    
    var toServerDateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = Date.serverFormat
        return formatter.string(from: self)
    }
    
    func compare(with date: Date) -> ComparisonResult {
        return compareDay(from: date, calendar: Date.calendar)
    }
    
    func getElapsedInterval() -> String {
        let interval = Date.calendar.dateComponents([.year, .month, .day], from: self, to: Date())
        
        if let year = interval.year, year > 0 {
            return year == 1 ? "\(year)" + " " + "year ago" :
                "\(year)" + " " + "years ago"
        } else if let month = interval.month, month > 0 {
            return month == 1 ? "\(month)" + " " + "month ago" :
                "\(month)" + " " + "months ago"
        } else if let day = interval.day, day > 0 {
            return day == 1 ? "\(day)" + " " + "day ago" :
                "\(day)" + " " + "days ago"
        } else {
            return "a moment ago"
        }
    }
    
    func toString(style: DateFormatter.Style = .medium) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = style
        return formatter.string(from: self)
    }

    func compareDay(from date: Date, calendar: Calendar = .current) -> ComparisonResult {
        return calendar.compare(self, to: date, toGranularity: .day)
    }
    
    func add(days: Int) -> Date? {
        let resultDay = Date.calendar.date(byAdding: .day, value: days, to: self)
        return resultDay
    }
    
    func add(hours: Int) -> Date? {
        let resultDay = Date.calendar.date(byAdding: .hour, value: hours, to: self)
        return resultDay
    }
}

extension Array where Element: Any {
    func element(at index: Int) -> Element? {
        guard index >= 0 && index < count else {
            return nil
        }
        return self[index]
    }
}
