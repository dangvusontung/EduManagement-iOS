//
//  DateFormatterManager.swift
//  EduManager
//
//  Created by TungDVS on 01/09/2024.
//

import Foundation

class DateFormatterManager {
    private var cache: [String: DateFormatter] = [:]

    static let shared = DateFormatterManager()

    private init() {}

    func formatter(for strategy: DateFormatStrategy) -> DateFormatter {
        let key = cacheKey(for: strategy)

        if let formatter = cache[key] {
            return formatter
        }

        let newFormatter = createFormatter(for: strategy)
        cache[key] = newFormatter
        return newFormatter
    }

    private func createFormatter(for strategy: DateFormatStrategy) -> DateFormatter {
        let dateFormatter = DateFormatter()

        switch strategy {
        case .shortDate:
            dateFormatter.dateStyle = .short
        case .fullDate:
            dateFormatter.dateStyle = .full
        case .hhMM:
            dateFormatter.dateFormat = "HH:mm"
        case .dayInWeek:
            dateFormatter.dateFormat = "EEEE"
        case .monthAndYear:
            dateFormatter.dateFormat = "MMMM yyyy"
        case .fullDateTime:
            dateFormatter.dateStyle = .full
            dateFormatter.timeStyle = .short
        case .iso8601:
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        case .timeWithSeconds:
            dateFormatter.dateFormat = "HH:mm:ss"
        case .dayMonth(let locale):
            dateFormatter.locale = locale
            dateFormatter.dateFormat = "dd MMMM"
        case .custom(let format):
            dateFormatter.dateFormat = format
        }

        return dateFormatter
    }

    private func cacheKey(for strategy: DateFormatStrategy) -> String {
        switch strategy {
        case .shortDate:
            return "shortDate"
        case .fullDate:
            return "fullDate"
        case .hhMM:
            return "hhMM"
        case .dayInWeek:
            return "dayInWeek"
        case .monthAndYear:
            return "monthAndYear"
        case .fullDateTime:
            return "fullDateTime"
        case .iso8601:
            return "iso8601"
        case .timeWithSeconds:
            return "timeWithSeconds"
        case .dayMonth(let locale):
            return "dayMonth_\(locale.identifier)"
        case .custom(let format):
            return "custom_\(format)"
        }
    }
}
