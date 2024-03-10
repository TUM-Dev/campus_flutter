//
//  DateExtension.swift
//  CalendarWidgetExtension
//
//  Created by Jakob Körber on 04.03.24.
//

import Foundation

extension Date {
    var isToday: Bool {
        let calendar = Calendar.autoupdatingCurrent
        return calendar.isDateInToday(self)
    }
    
    var isTomorrow: Bool {
        let calendar = Calendar.autoupdatingCurrent
        return calendar.isDateInTomorrow(self)
    }
    
    var timeAgo: String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.year, .month, .day, .hour, .minute, .second]
        formatter.zeroFormattingBehavior = .dropAll
        formatter.maximumUnitCount = 1
        if (Date().timeIntervalSince(self) > 60) {
            return "\(String(format: formatter.string(from: self, to: Date()) ?? "")) ago"
        } else {
            return "moments ago"
        }
    }
}
