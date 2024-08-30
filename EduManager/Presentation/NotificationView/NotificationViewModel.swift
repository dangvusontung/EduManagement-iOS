//
//  NotificationViewModel.swift
//  EduManager
//
//  Created by TungDVS on 28/08/2024.
//

import Foundation

@Observable
class NotificationViewModel {
    var newNotifications: [String]
    var earlierNotifications: [String]

    init(newNotifications: [String], earlierNotifications: [String]) {
        self.newNotifications = newNotifications
        self.earlierNotifications = earlierNotifications
    }

    func markAsRead(_ notification: String) {
        // Implementation for marking a notification as read
    }

    func clearAll() {
        // Implementation for clearing all notifications
    }
}
