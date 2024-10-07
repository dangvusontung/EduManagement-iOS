//
//  NotificationDependencyFactoryImpl.swift
//  EduManager
//
//  Created by TungDVS on 30/08/2024.
//

import Foundation

class NotificationDependencyFactoryImpl: NotificationDependencyFactory {
    func makeGetNotificationUseCase() -> any GetNotificationUseCase {
        return GetNotificationUseCaseImpl()
    }
}
