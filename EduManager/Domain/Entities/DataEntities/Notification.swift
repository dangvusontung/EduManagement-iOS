//
//  Notification.swift
//  EduManager
//
//  Created by TungDVS on 28/08/2024.
//

import Foundation

struct Notification {
    let id: String
    let time: Date
    let title: String
    let content: String
}

extension Notification: Identifiable {}
