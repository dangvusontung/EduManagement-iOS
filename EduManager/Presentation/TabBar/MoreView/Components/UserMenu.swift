//
//  UserMenu.swift
//  EduManager
//
//  Created by TungDVS on 28/08/2024.
//

import Foundation

enum AdminSection: String, CaseIterable {
    case resourceManagement = "Human Resources Management"
    case academicManagement = "Academic Management"
    case financialManagement = "Financial Management"
    case system = "System & Settings"
    
    var items: [AdminItem] {
        switch self {
        case .resourceManagement:
            return [.studentManagement, .teacherManagement]
        case .academicManagement:
            return [.courseManagement, .classManagement]
        case .financialManagement:
            return [.financeManagement, .reportsAnalytics]
        case .system:
            return [.systemSettings, .userManagement]
        }
    }
}

enum AdminItem: String {
    case studentManagement = "Student Management"
    case teacherManagement = "Teacher Management"
    case courseManagement = "Course Management"
    case classManagement = "Class Management"
    case financeManagement = "Finance Management"
    case reportsAnalytics = "Reports & Analytics"
    case systemSettings = "System Settings"
    case userManagement = "User Management"
}
