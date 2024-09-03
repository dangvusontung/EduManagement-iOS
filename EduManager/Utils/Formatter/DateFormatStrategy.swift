//
//  DateFormatStrategy.swift
//  EduManager
//
//  Created by TungDVS on 01/09/2024.
//

import Foundation

enum DateFormatStrategy {
    case shortDate
    case fullDate
    case hhMM
    case dayInWeek
    case monthAndYear
    case fullDateTime
    case iso8601
    case timeWithSeconds
    case dayMonth(locale: Locale = Locale.current)
    case custom(format: String)
}
