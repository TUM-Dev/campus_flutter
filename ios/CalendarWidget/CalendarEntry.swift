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
    
    var isCanceled: Bool {
        return status == "CANCEL"
    }
    
    var type: CalendarEventType {
        if isCanceled {
            return .canceled
        } else if title.hasSuffix("VO") || title.hasSuffix("VU") || title.hasSuffix("VI") {
            return .lecture
        } else if title.hasSuffix("UE") {
            return .exercise
        } else {
            return .other
        }
    }
    
    var eventColor: Color {
        if (color == nil) {
            switch type {
            case .canceled:
                return Color(red: 244 / 255, green: 67 / 255, blue: 54 / 255)
            case .lecture:
                return Color(red: 76 / 255, green: 175 / 255, blue: 80 / 255)
            case .exercise:
                return Color(red: 255 / 255, green: 152 / 255, blue: 0 / 255)
            default:
                return .accent
            }
        }
        else {
            return Color(argb: UInt32(color!))
        }
    }
}
