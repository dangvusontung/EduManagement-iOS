//
//  NotificationViewModel.swift
//  EduManager
//
//  Created by TungDVS on 28/08/2024.
//

import Foundation

@Observable
class NotificationViewModel {
    var notifications: [Notification] = []

    @ObservationIgnored private var fetchNotificationsUseCase: any FetchNotificationsUseCase

    init(factory: NotificationUseCaseFactory) {
        self.fetchNotificationsUseCase = factory.makeFetchNotificationsUseCase()
        Task {
            try await fetchNotifications()
        }
    }

    func fetchNotifications() async throws {
        notifications = try await fetchNotificationsUseCase.execute()
    }
}

// MARK: - Models

struct Notification: Identifiable {
    let id: UUID
    let message: String
}

// MARK: - Use Cases

protocol NotificationUseCaseFactory {
    func makeFetchNotificationsUseCase() -> any FetchNotificationsUseCase
}

protocol FetchNotificationsUseCase {
    func execute() async throws -> [Notification]
}

// MARK: - Preview Helpers

struct PreviewNotificationUseCaseFactory: NotificationUseCaseFactory {
    func makeFetchNotificationsUseCase() -> any FetchNotificationsUseCase {
        PreviewFetchNotificationsUseCase()
    }
}

struct PreviewFetchNotificationsUseCase: FetchNotificationsUseCase {
    func execute() async throws -> [Notification] {
        return [
            Notification(id: UUID(), message: "New assignment due tomorrow"),
            Notification(id: UUID(), message: "Upcoming exam in 3 days"),
            Notification(id: UUID(), message: "Grade posted for Math 101")
        ]
    }
}
