//
//  CalendarWidgetContent.swift
//  CalendarWidgetExtension
//
//  Created by Jakob Körber on 08.03.24.
//

import SwiftUI

struct CalendarWidgetContent: View {
    @Environment(\.colorScheme) var colorScheme
    
    var availableItems: Int
    var events: [Date: [CalendarEntry]] = [:]
    
    init(entry: CalendarWidgetEntry) {
        self.availableItems = entry.size == .systemLarge ? 4 : 2
        self.events = groupEntriesByDate(entries: Array(entry.entries.prefix(availableItems)))
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("MMMMdd")
        return formatter
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if availableItems == 2, let firstEntry = events.sorted(by: { $0.key < $1.key }).first {
                dateHeader(date: firstEntry.key)
                    .padding(.bottom, 8)
                
                if !firstEntry.value.isEmpty {
                    ForEach(firstEntry.value, id: \.id) { event in
                        CalendarEventView(event: event, color: event.eventColor)
                            .padding(.bottom, 8)
                    }
                }
            } else {
                ForEach(events.keys.sorted(by: <), id: \.self) { key in
                    if let eventsAtDate = events[key], !eventsAtDate.isEmpty {
                        dateHeader(date: key)
                            .padding(.bottom, 8)
                        ForEach(eventsAtDate, id: \.id) { event in
                            CalendarEventView(event: event, color: event.eventColor)
                                .padding(.bottom, 8)
                        }
                    }
                }
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }
    
    func dateHeader(date: Date) -> some View {
        HStack {
            Image(systemName: "calendar")
            
            if date.isToday {
                Text("Today")
            } else if date.isTomorrow {
                Text("Tomorrow")
            } else {
                Text(dateFormatter.string(from: date))
            }
        }
        .font(.body.bold())
        .lineLimit(1)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func groupEntriesByDate(entries: [CalendarEntry]) -> [Date: [CalendarEntry]] {
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
}
