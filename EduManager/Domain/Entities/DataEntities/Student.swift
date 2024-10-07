//
//  Student.swift
//  EduManager
//
//  Created by TungDVS on 25/08/2024.
//

import Foundation

struct Student: Identifiable {
    let id: String
    let name: String
    let dateOfBirth: Date
    
    let parentId: String
}

extension Student {
    
    static var mock: Student {
        return Student(id: "id0", name: "Student 0", dateOfBirth: Date(), parentId: "parent0")
    }
    
    static var mocks: [Student] {
        return Array(0...10).map {
            Student(id: "id\($0)", name: "Student \($0)", dateOfBirth: Date(), parentId: "parent\($0)")
        }
    }
}
