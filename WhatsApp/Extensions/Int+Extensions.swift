//
//  Int+Extensions.swift
//  WhatsApp
//
//  Created by Hüseyin Umut Kardaş on 20.11.2025.
//

import Foundation

extension Int {
    func toHourMinute() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        formatter.locale = Locale(identifier: "tr_TR")
        formatter.timeZone = TimeZone.current
        return formatter.string(from: date)
    }
}
