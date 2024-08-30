//
//  AccountType.swift
//  EduManager
//
//  Created by TungDVS on 25/08/2024.
//

import Foundation

enum AccountType: Int {
    case admin
    case teacher
    case assistance
    case parent
    case student
    case unknown
}

extension AccountType: Identifiable {
    var id: Int {
        self.rawValue
    }
}
