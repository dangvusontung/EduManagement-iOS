//
//  NotificationDependencyFactory.swift
//  EduManager
//
//  Created by TungDVS on 30/08/2024.
//

import Foundation

protocol NotificationDependencyFactory {
    func makeFetchNotificationsUseCase() -> any FetchNotificationsUseCase
    func makeMarkNotificationAsReadUseCase() -> any MarkNotificationAsReadUseCase
    func makeClearAllNotificationsUseCase() -> any ClearAllNotificationsUseCase
}

class NotificationDependencyFactoryPreview: NotificationDependencyFactory {
    func makeFetchNotificationsUseCase() -> any FetchNotificationsUseCase {
        // Return a mock implementation for preview
        return MockFetchNotificationsUseCase()
    }

    func makeMarkNotificationAsReadUseCase() -> any MarkNotificationAsReadUseCase {
        // Return a mock implementation for preview
        return MockMarkNotificationAsReadUseCase()
    }

    func makeClearAllNotificationsUseCase() -> any ClearAllNotificationsUseCase {
        // Return a mock implementation for preview
        return MockClearAllNotificationsUseCase()
    }
}

class NotificationDependencyFactoryImpl: NotificationDependencyFactory {
    func makeFetchNotificationsUseCase() -> any FetchNotificationsUseCase {
        // Return the actual implementation
        return FetchNotificationsUseCaseImpl()
    }

    func makeMarkNotificationAsReadUseCase() -> any MarkNotificationAsReadUseCase {
        // Return the actual implementation
        return MarkNotificationAsReadUseCaseImpl()
    }

    func makeClearAllNotificationsUseCase() -> any ClearAllNotificationsUseCase {
        // Return the actual implementation
        return ClearAllNotificationsUseCaseImpl()
    }
}
