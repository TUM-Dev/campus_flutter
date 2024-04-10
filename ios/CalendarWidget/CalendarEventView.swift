//
//  CalendarEventView.swift
//  CalendarWidgetExtension
//
//  Created by Jakob Körber on 04.03.24.
//

import SwiftUI

struct CalendarEventView: View {
    
    let event: CalendarEntry
    let color: Color
    let isFirst: Bool
    
    private var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }
    
    private var dayNumberFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        return formatter
    }
    
    private var monthNameFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM"
        return formatter
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(dayNumberFormatter.string(from: event.startDate))
                    .font(.caption)
                    .fontWeight(.bold)
                Text(monthNameFormatter.string(from: event.startDate).capitalized)
                    .font(.caption)
            }
            .frame(width: 30)
            .opacity(isFirst ? 1 : 0)
            
            VStack(alignment: .leading, spacing: 3) {
                Text(event.title)
                    .font(.caption)
                    .bold()
                    .lineLimit(1)
                
                let timeText = "\(timeFormatter.string(from: event.startDate)) - \(timeFormatter.string(from: event.endDate))"
                
                if (event.location != nil) {
                    Text("\(timeText) | \(event.location!)")
                        .font(.caption2)
                        .lineLimit(1)
                } else {
                    Text(timeText)
                        .font(.caption2)
                        .lineLimit(1)
                }
            }
            .padding(6)
            .foregroundStyle(.white)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .background(ContainerRelativeShape()
                            .fill(color))
        }
        .padding(EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12))
    }
}
