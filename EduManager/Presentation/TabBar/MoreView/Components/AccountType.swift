//
//  AccountType.swift
//  EduManager
//
//  Created by TungDVS on 25/08/2024.
//

import Foundation

enum AccountType: Int {
    case admin
    case moderator
    case teacher
    case assistance
    case parent
    case student
    case unknown
}

extension AccountType {
    var items: [DashboardViewType] {
        switch self {
        case .admin:
            return [.dashboard, .schedule, .classManagement, .finacialReport, .moreMenu]
        case .teacher, .assistance:
            return [.schedule, .myClass, .salaryReport, .moreMenu]
        case .moderator:
            return [.dashboard, .schedule, .classManagement, .moreMenu]
        case .parent:
            return [.schedule, .myClass, .moreMenu]
        case .student:
            return [.schedule, .myClass, .ranking, .moreMenu]
        default:
            return []
        }
    }
}

extension AccountType: Identifiable {
    var id: Int {
        self.rawValue
    }
}
