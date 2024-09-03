//
//  ScheduleEvent.swift
//  EduManager
//
//  Created by TungDVS on 29/08/2024.
//

import Foundation

struct ScheduleEvent {
    let id: String
    let name: String               // Name of the event or class
    let courseId: String           // Identifier for the course
    let startTime: Date            // Start time of the event
    let endTime: Date              // End time of the event
    let location: String?          // Location of the event, optional
    let description: String?       // Brief description of the event, optional
    let personInChargeName: String // name of the PIC
}

extension ScheduleEvent: Identifiable {}
