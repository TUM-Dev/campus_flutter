//
//  CalendarWidgetEntry.swift
//  CalendarWidgetExtension
//
//  Created by Jakob Körber on 01.02.24.
//

import WidgetKit
import SwiftUI

struct CalendarWidgetEntry: TimelineEntry {
    let date: Date
    let entries: [CalendarEntry]
}

/*
struct CalendarWidgetEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(Date().description)
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                    
                    Text(entry.date.description)
                        .foregroundColor(.white)
                        .font(.system(size: 14))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .background(Color.accentColor) // Adjust color as needed
            
            VStack {
                ForEach(entry.entries) { calendarEntry in
                    Text(calendarEntry.title)
                }
            }
            
            Spacer()
        }
        .background(Color.white)
    }
}

struct CalendarWidgetRowView : View {
    var entry: CalendarEntry
    
    var body: some View {
        VStack {
            Text(entry.title)
            Text("\(entry.startDate) \(entry.location)")
        }.background(Color.blue)
    }
}
*/
