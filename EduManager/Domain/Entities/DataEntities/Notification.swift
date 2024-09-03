//
//  Notification.swift
//  EduManager
//
//  Created by TungDVS on 28/08/2024.
//

import Foundation

enum NotificationContentType: Int {
    case classContent
    case couresContent
    case scoreContent
    case leaderboardContent
}

struct Notification {
    let id: String
    let time: Date
    let title: String
    let content: String
    let contentType: NotificationContentType
}

extension Notification: Identifiable {}
