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
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }
}
