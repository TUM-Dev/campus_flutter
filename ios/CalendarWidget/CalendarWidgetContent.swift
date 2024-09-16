//
//  CalendarWidgetContent.swift
//  CalendarWidgetExtension
//
//  Created by Jakob Körber on 08.03.24.
//

import SwiftUI
import WidgetKit

struct CalendarWidgetContent: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.widgetRenderingMode) var widgetRenderingMode
    
    var availableItems: Int
    var widgetFamily: WidgetFamily
    var events: [Date: [CalendarEntry]] = [:]
    var updatedAt: Date
    
    init(entry: CalendarWidgetEntry) {
        self.widgetFamily = entry.size
        self.updatedAt = entry.date
        self.availableItems = CalendarWidgetContent.getAvailableItems(widgetFamily: entry.size)
        self.events = CalendarWidgetContent.groupEntriesByDate(entries: Array(entry.entries.prefix(availableItems)))
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("MMMM d, yyyy")
        return formatter
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(dateFormatter.string(from: Date()))
                    .fontWeight(.semibold)
                    .font(.callout)
                Text(updatedAt.timeAgo != nil ? "\(updatedAt.timeAgo!) ago" : "moments ago")
                    .font(.footnote)
            }
            .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .widgetAccentable(false)
            .foregroundStyle(.white)
            .background(Color.accent.widgetAccentable(true))
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
            
            if (events.isEmpty) {
                Spacer()
                Text("No lectures planned :)")
                    .font(.footnote)
                    .padding()
            } else if (Date().timeIntervalSince(updatedAt) > (14 * 24 * 60 * 60)) {
                // 14 days * 24 hours * 60 minutes * 60 seconds
                Spacer()
                Text(widgetFamily != .systemSmall ? "This widget was last updated over 2 weeks ago.\nOpen the application to update the data" : "Open the application to update the widget")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .padding()
            } else {
                ForEach(events.keys.sorted(), id: \.self) { eventDate in
                    ForEach((events[eventDate] ?? []).indices, id: \.self) { eventIndex in
                        let event = events[eventDate]![eventIndex]
                        CalendarEventView(event: event, color: event.eventColor, isFirst: eventIndex == 0)
                    }
                }
            }
            Spacer()
        }
    }
    
    static func groupEntriesByDate(entries: [CalendarEntry]) -> [Date: [CalendarEntry]] {
        var groupedEntries: [Date: [CalendarEntry]] = [:]
        
        for entry in entries {
            let calendar = Calendar.current
            let startDateComponents = calendar.dateComponents([.year, .month, .day], from: entry.startDate)
            if let startDate = calendar.date(from: startDateComponents) {
                if var entriesForDate = groupedEntries[startDate] {
                    entriesForDate.append(entry)
                    groupedEntries[startDate] = entriesForDate
                } else {
                    groupedEntries[startDate] = [entry]
                }
            }
        }
        return groupedEntries
    }
    
    static func getAvailableItems(widgetFamily: WidgetFamily) -> Int {
        switch widgetFamily {
        case .systemSmall, .systemMedium:
            return 2
        case .systemLarge, .systemExtraLarge:
            return 5
        default:
            return 2
        }
    }
}
