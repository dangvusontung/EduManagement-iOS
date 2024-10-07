//
//  CalendarDependencyFactory.swift
//  EduManager
//
//  Created by TungDVS on 29/08/2024.
//

import Foundation

protocol CalendarDependencyFactory {
    func makeGetSchedulerUseCase() -> any GetScheduleUseCase
}
