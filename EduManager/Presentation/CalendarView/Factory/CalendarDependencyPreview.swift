//
//  CalendarDependencyPreview.swift
//  EduManager
//
//  Created by TungDVS on 29/08/2024.
//

import Foundation

class CalendarDependencyPreview: CalendarDependencyFactory {
    func makeGetSchedulerUseCase() -> any GetScheduleUseCase {
        GetScheduleUseCasePreview()
    }
}
