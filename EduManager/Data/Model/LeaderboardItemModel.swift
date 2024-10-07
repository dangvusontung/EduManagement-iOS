//
//  LeaderboardItemModel.swift
//  EduManager
//
//  Created by TungDVS on 18/9/24.
//

import Foundation
import RealmSwift

final class LeaderboardItemModel: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var student: StudentModel
    @Persisted var averageScore: Double
    @Persisted var totalStars: Int
}

extension LeaderboardItemModel: Codable {}
