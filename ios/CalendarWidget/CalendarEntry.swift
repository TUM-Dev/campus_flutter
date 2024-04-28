//
//  CalendarEntry.swift
//  Runner
//
//  Created by Jakob Körber on 31.01.24.
//

import Foundation
import SwiftUI

struct CalendarEntry: Codable, Identifiable {
    let id: String
    let title: String
    let status: String
    let startDate: Date
    let endDate: Date
    let location: String?
    let color: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "nr"
        case startDate = "dtstart"
        case endDate = "dtend"
        case title, location, status, color
    }
    
    var eventColor: Color {
        return color == nil ? .accent : Color(argb: UInt32(color!))
    }
}
