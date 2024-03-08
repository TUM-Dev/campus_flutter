//
//  CalendarWidget.swift
//  CalendarWidget
//
//  Created by Jakob Körber on 30.01.24.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> CalendarWidgetEntry {
        CalendarWidgetEntry(date: Date(), entries: [
            CalendarEntry(id: "0", title: "Lineare Algebra für Informatik", status: "Test", startDate: Date.now, endDate: Date.now, location: "Audimax")
        ])
    }
    
    func getSnapshot(in context: Context, completion: @escaping (CalendarWidgetEntry) -> ()) {
        if context.isPreview{
            let entry = placeholder(in: context)
            completion(entry)
        } else {
            let userDefaults = UserDefaults(suiteName: "group.de.tum.tca-widget")
            let calendarJson = userDefaults?.string(forKey: "calendar") ?? ""
            let calendarSaved = userDefaults?.string(forKey: "calendar_save")
            let data = Data(calendarJson.utf8)
            do {
                let decoder = JSONDecoder()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                let entries = try decoder.decode([CalendarEntry].self, from: data)
                let entry = CalendarWidgetEntry(date: dateFormatter.date(from: calendarSaved ?? "") ?? Date(), entries: entries)
                completion(entry)
            } catch {
                completion(Entry(date: Date(), entries: []))
            }
        }
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<CalendarWidgetEntry>) -> ()) {
        getSnapshot(in: context) { (entry) in
            let timeline = Timeline(entries: [entry], policy: .atEnd)
            completion(timeline)
        }
    }
}

struct CalendarWidget: Widget {
    let kind: String = "CalendarWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                CalendarWidgetContent(events: entry)
                    .containerBackground(Color.widgetBackground, for: .widget)
                    .widgetURL(URL(string: "tumCampusApp://message?homeWidget=calendar"))
            } else {
                CalendarWidgetContent(events: entry)
                    .padding()
                    .background()
                    .widgetURL(URL(string: "tumCampusApp://message?homeWidget=calendar"))
            }
        }
        .configurationDisplayName("Calendar Widget")
        .description("An Overview About Your Upcoming Events.")
    }
}

struct CalendarWidgetContent: View {
    
    @Environment(\.widgetFamily) var widgetFamily
    @Environment(\.colorScheme) var colorScheme
    
    var events: [Date: [CalendarEntry]] = [:]
    
    private var displayedItems: Int {
        switch widgetFamily {
        case .systemSmall, .systemMedium:
            return 2
        case .systemLarge:
            return 5
        default:
            return 2
        }
    }
    
    init(events: CalendarWidgetEntry) {
        self.events = groupEntriesByDate(entries: Array(events.entries.prefix(4)))
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("MMMMdd")
        return formatter
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if displayedItems == 2, let firstEntry = events.sorted(by: { $0.key < $1.key }).first {
                dateHeader(date: firstEntry.key)
                    .padding(.bottom, 8)
                
                if !firstEntry.value.isEmpty {
                    ForEach(firstEntry.value.prefix(displayedItems), id: \.id) { event in
                        CalendarEventView(event: event, color: event.eventColor)
                            .padding(.bottom, 8)
                    }
                }
            } else {
                ForEach(events.keys.sorted(by: <), id: \.self) { key in
                    dateHeader(date: key)
                        .padding(.bottom, 8)
                    
                    if let eventsAtDate = events[key], !eventsAtDate.isEmpty {
                        ForEach(eventsAtDate.prefix(displayedItems), id: \.id) { event in
                            CalendarEventView(event: event, color: event.eventColor)
                                .padding(.bottom, 8)
                        }
                    }
                }
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
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
