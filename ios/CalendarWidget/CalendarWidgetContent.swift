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
    var updatedAt: Date

    init(entry: CalendarWidgetEntry) {
        self.availableItems = entry.size == .systemLarge ? 5 : 2
        self.updatedAt = entry.date
        self.events = groupEntriesByDate(entries: Array(entry.entries.prefix(availableItems)))
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
            .background(.accent)
            .foregroundStyle(.white)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))

            ForEach(events.keys.sorted(), id: \.self) { eventDate in
                ForEach((events[eventDate] ?? []).indices, id: \.self) { eventIndex in
                    let event = events[eventDate]![eventIndex]
                    CalendarEventView(event: event, color: event.eventColor, isFirst: eventIndex == 0)
                }
            }
            Spacer()
        }
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
