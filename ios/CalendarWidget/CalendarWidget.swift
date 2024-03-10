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
        CalendarWidgetEntry(
            date: Date(),
            entries: [
                CalendarEntry(id: "0", title: "Lineare Algebra für Informatik", status: "Test", startDate: Date.now, endDate: Date.now, location: "Audimax")
            ],
            size: context.family
        )
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
                let entry = CalendarWidgetEntry(date: dateFormatter.date(from: calendarSaved ?? "") ?? Date(), entries: entries, size: context.family)
                completion(entry)
            } catch {
                completion(Entry(date: Date(), entries: [], size: context.family))
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
                CalendarWidgetContent(entry: entry)
                    .containerBackground(Color.widgetBackground, for: .widget)
                    .widgetURL(URL(string: "tumCampusApp://message?homeWidget=calendar"))
            } else {
                CalendarWidgetContent(entry: entry)
                    .background()
                    .widgetURL(URL(string: "tumCampusApp://message?homeWidget=calendar"))
            }
        }
        .contentMarginsDisabled()
        .configurationDisplayName("Calendar Widget")
        .description("An Overview About Your Upcoming Events.")
    }
}
