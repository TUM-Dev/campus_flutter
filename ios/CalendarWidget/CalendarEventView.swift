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
    
    @State private var height: CGFloat = 0
    
    private var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }
    
    var body: some View {
        HStack(alignment: .center) {
            Capsule()
                .frame(width: 4)
                .foregroundColor(color)
            
            VStack(alignment: .leading) {
                
                let timeText = "\(timeFormatter.string(from: event.startDate)) - \(timeFormatter.string(from: event.endDate))"
                
                Label(timeText, systemImage: "clock")
                    .font(.caption2)
                    .foregroundColor(color)
                
                Text(event.title)
                    .font(.caption)
                    .bold()
                    .lineLimit(1)
                
                Label(event.location, systemImage: "mappin")
                    .lineLimit(1)
                    .font(.caption2)
            }
        }
        .frame(height: 40)
    }
}
