//
//  DashboardViewModel.swift
//  EduManager
//
//  Created by TungDVS on 30/08/2024.
//

import Foundation

class DashboardViewModel {
    var userName: String
    var upcomingEvents: [String]
    var recentActivities: [String]

    init(userName: String, upcomingEvents: [String], recentActivities: [String]) {
        self.userName = userName
        self.upcomingEvents = upcomingEvents
        self.recentActivities = recentActivities
    }

    func viewSchedule() {
        // Implementation for viewing schedule
    }

    func checkGrades() {
        // Implementation for checking grades
    }
}
