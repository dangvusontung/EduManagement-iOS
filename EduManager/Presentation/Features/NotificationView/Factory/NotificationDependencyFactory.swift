//
//  NotificationDependencyFactory.swift
//  EduManager
//
//  Created by TungDVS on 30/08/2024.
//

import Foundation

protocol NotificationDependencyFactory: AnyObject {
    func makeGetNotificationUseCase() -> any GetNotificationUseCase
}
