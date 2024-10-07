//
//  LeaderboardItem.swift
//  EduManager
//
//  Created by TungDVS on 18/9/24.
//

import Foundation

struct LeaderboardItem {
    let student: Student
    let averageScore: Double
    let totalStars: Int
}

extension LeaderboardItem: Identifiable {
    public var id: String { student.id }
}

extension LeaderboardItem {
    static var mock: LeaderboardItem {
        return .init(student: .mock, averageScore: 100, totalStars: 10)
    }
    
    static var mockItems: [LeaderboardItem] {
        Student.mocks.map { .init(student: $0, averageScore: 100, totalStars: 10) }
    }
}
