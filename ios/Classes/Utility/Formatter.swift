//
//  Formatter.swift
//  Tnex messenger
//
//  Created by Din Vu Dinh on 27/02/2022.
//

import Foundation

enum DateFormat: String {
    case yearMonthDay = "yyyy-MM-dd"
}

enum Formatter {
    // MARK: Relative Date Formatter
    
//    static func string(forRelativeDate relativeDate: Date,
//                       to otherDate: Date = Date(),
//                       locale: Locale = .current) -> String {
//        relativeDateTimeFormatter(dateTimeStyle: .named, unitsStyle: .full, formattingContext: nil, locale: locale)
//            .localizedString(for: relativeDate, relativeTo: otherDate)
//    }

    // MARK: Date Formatter
    private static func dateFormatter(format: DateFormat? = nil,
                                      dateStyle: DateFormatter.Style? = nil,
                                      timeStyle: DateFormatter.Style? = nil,
                                      locale: Locale) -> DateFormatter {
        let formatter = DateFormatter()
        if let format = format {
            formatter.dateFormat = format.rawValue
        }
        if let dateStyle = dateStyle {
            formatter.dateStyle = dateStyle
        }
        if let timeStyle = timeStyle {
            formatter.timeStyle = timeStyle
        }
        formatter.locale = locale
        return formatter
    }

    static func string(for date: Date, format: DateFormat, locale: Locale = .current) -> String {
        let formatter = dateFormatter(format: format, locale: locale)
        return formatter.string(from: date)
    }

    static func string(for date: Date, dateStyle: DateFormatter.Style, locale: Locale = .current) -> String {
        string(for: date, dateStyle: dateStyle, timeStyle: .none, locale: locale)
    }

    static func string(for date: Date, timeStyle: DateFormatter.Style, locale: Locale = .current) -> String {
        string(for: date, dateStyle: .none, timeStyle: timeStyle, locale: locale)
    }

    static func string(for date: Date,
                       dateStyle: DateFormatter.Style,
                       timeStyle: DateFormatter.Style,
                       locale: Locale = .current) -> String {
        let formatter = dateFormatter(dateStyle: dateStyle, timeStyle: timeStyle, locale: locale)
        return formatter.string(from: date)
    }
}
