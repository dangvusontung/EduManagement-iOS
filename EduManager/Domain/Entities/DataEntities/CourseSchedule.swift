//
//  CourseSchedule.swift
//  EduManager
//
//  Created by TungDVS on 29/08/2024.
//

import Foundation

struct CourseSchedule {
    let weekday: Weekday         // The day of the week (e.g., Monday, Thursday)
    let isBiweekly: Bool         // Optional: True if the event occurs every two weeks
    let specificDates: [Date]    // Optional: Specific dates if the class doesn’t follow a regular pattern
}

enum Weekday: String {
    case monday = "Monday"
    case tuesday = "Tuesday"
    case wednesday = "Wednesday"
    case thursday = "Thursday"
    case friday = "Friday"
    case saturday = "Saturday"
    case sunday = "Sunday"
}
