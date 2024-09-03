//
//  Date+Extension.swift
//  EduManager
//
//  Created by TungDVS on 01/09/2024.
//

import Foundation

import Foundation

extension Date {
    func format(using strategy: DateFormatStrategy) -> String {
        let formatter = DateFormatterManager.shared.formatter(for: strategy)
        return formatter.string(from: self)
    }
}
