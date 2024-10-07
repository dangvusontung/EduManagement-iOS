//
//  LeaderboardDependencyFactory.swift
//  EduManager
//
//  Created by TungDVS on 03/09/2024.
//

import Foundation

enum LeaderboardSortingCondition {
    case byReward
    case byScore
}


struct GetLeaderboardParam {
    // Sort by reward
    var sortBy: LeaderboardSortingCondition
    var startDate: Date?
    var endDate: Date?
    
}


class LeaderboardDependencyFactory {
    func makeLeaderBoardViewModel() -> LeaderboardViewModel {
        LeaderboardViewModel()
    }
}
