//
//  GetScheduleUseCaseImpl.swift
//  EduManager
//
//  Created by TungDVS on 29/08/2024.
//

import Foundation

class GetScheduleUseCaseImpl: GetScheduleUseCase {
    func execute(input: GetScheduleUseCaseParam) async throws -> Array<ScheduleEvent> {
        let array = Array(0...10)
        let events = array.map { index in
            ScheduleEvent(
                id: "a\(index)",
                name: "Event \(index + 1)",
                courseId: "Course \(index + 1)",
                startTime: Date().addingTimeInterval(Double(index) * 3600), // Each event starts 1 hour after the previous one
                endTime: Date().addingTimeInterval(Double(index) * 3600 + 3600), // Each event lasts for 1 hour
                location: index % 2 == 0 ? "Room \(index + 1)" : nil, // Every other event has a location
                description: index % 2 == 0 ? "This is a description for event \(index + 1)" : nil, // Every other event has a description
                personInChargeName: "Person \(index + 1)"
            )
        }
    
        return events
    }
}
