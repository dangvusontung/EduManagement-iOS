//
//  TeacherAssistance.swift
//  EduManager
//
//  Created by TungDVS on 25/08/2024.
//

import Foundation

struct TeacherAssistance: Identifiable {
    let id: String
    let name: String
    let dateOfBirth: String
    let description: String 
    let salary: Double
}

extension TeacherAssistance {
    static var mocks: [TeacherAssistance] {
        return Array(0...10).map {
            TeacherAssistance(id: "\($0)", name: "TeacherAssistance \($0)", dateOfBirth: "Today", description: "Description", salary: 500000)
        }
    }
}
