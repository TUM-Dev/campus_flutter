//
//  ColorExtension.swift
//  CalendarWidgetExtension
//
//  Created by Jakob Körber on 03.04.24.
//

import Foundation
import SwiftUI

extension Color {
    init(argb: UInt32) {
        let alpha = Double((argb >> 24) & 0xFF) / 255.0
        let red = Double((argb >> 16) & 0xFF) / 255.0
        let green = Double((argb >> 8) & 0xFF) / 255.0
        let blue = Double(argb & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}
