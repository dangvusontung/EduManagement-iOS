//
//  GetScheduleUseCasePreview.swift
//  EduManager
//
//  Created by TungDVS on 29/08/2024.
//

import Foundation

class GetScheduleUseCasePreview: GetScheduleUseCase {
    func execute(input: GetScheduleUseCaseParam) async throws -> [ScheduleEvent] {
        let event = ScheduleEvent(id: "", name: "Event demo", courseId: "", startTime: Date(), endTime: Date(), location: "Home", description: "Hello", personInChargeName: "Tung")
        return [
            event,
            event,
            event,
            event
        ]
    }
}
