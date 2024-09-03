//
//  Teacher.swift
//  EduManager
//
//  Created by TungDVS on 25/08/2024.
//

import Foundation

struct Teacher {
    let id: String
    let name: String
    let dateOfBirth: Date
    let salary: Double
    let description: String
    let joinedDate: Date
}

extension Teacher {
    static var mock: Teacher {
        return Teacher(id: "id", name: "Teacher", dateOfBirth: Date(), salary: 500000, description: "Description", joinedDate: Date().addingTimeInterval(-3600 * 365))
    }

    static var mocks: [Teacher] {
        return Array(0...10).map {
            Teacher(id: "id\($0)", name: "Teacher \($0)", dateOfBirth: Date(), salary: 500000, description: "Description", joinedDate: Date().addingTimeInterval(-3600 * 365 * 1))
        }
    }
}
