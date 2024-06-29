//
//  DateTime.swift
//
//
//  Created by Yassine Lafryhi on 29/6/2024.
//

import Foundation

public enum DateTime {
    static func now() -> Date {
        Date()
    }
}

extension Date {
    public func strftime(_ format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
