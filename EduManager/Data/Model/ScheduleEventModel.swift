//
//  ScheduleEventModel.swift
//  EduManager
//
//  Created by TungDVS on 29/08/2024.
//

import Foundation
import RealmSwift

class ScheduleEventModel: Object {
    @Persisted var name: String
    @Persisted var courseId: String
    @Persisted var startTime: String
    @Persisted var endTime: String
    @Persisted var location: String
    @Persisted var eventDescription: String
}
