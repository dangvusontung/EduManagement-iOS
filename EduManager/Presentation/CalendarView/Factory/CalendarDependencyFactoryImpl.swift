//
//  CalendarDependencyFactoryImpl.swift
//  EduManager
//
//  Created by TungDVS on 29/08/2024.
//

import Foundation

class CalendarDependencyFactoryImpl: CalendarDependencyFactory {
    func makeGetSchedulerUseCase() -> any GetScheduleUseCase {
        GetScheduleUseCaseImpl()
    }
}
