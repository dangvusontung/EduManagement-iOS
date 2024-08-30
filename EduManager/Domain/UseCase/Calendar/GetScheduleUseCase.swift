//
//  GetScheduleUseCase.swift
//  EduManager
//
//  Created by TungDVS on 29/08/2024.
//

import Foundation

struct GetScheduleUseCaseParam: Encodable {
    let startDate: Date?
    let endDate: Date?
}

protocol GetScheduleUseCase: UseCase where Input == GetScheduleUseCaseParam, Output == [ScheduleEvent] {}
