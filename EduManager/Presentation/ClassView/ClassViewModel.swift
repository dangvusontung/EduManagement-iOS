//
//  ClassViewModel.swift
//  EduManager
//
//  Created by TungDVS on 30/08/2024.
//

import Foundation

@Observable
class ClassViewModel {
    var currentClasses: [String]
    var upcomingClasses: [String]

    init(currentClasses: [String], upcomingClasses: [String]) {
        self.currentClasses = currentClasses
        self.upcomingClasses = upcomingClasses
    }

    func viewSchedule() {
        // Implementation for viewing schedule
    }

    func viewGrades() {
        // Implementation for viewing grades
    }
}
