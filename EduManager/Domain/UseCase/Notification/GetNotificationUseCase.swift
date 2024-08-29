//
//  GetNotificationUseCase.swift
//  EduManager
//
//  Created by TungDVS on 28/08/2024.
//

import Foundation

struct GetNotificationUseCaseParam {
    let startDate: Date?
    let endDate: Date?
}

protocol GetNotificationUseCase: UseCase where Input == GetNotificationUseCaseParam, Output == [Notification] {}
