//
//  GetNotificationUseCaseImpl.swift
//  EduManager
//
//  Created by TungDVS on 28/08/2024.
//

import Foundation

class GetNotificationUseCaseImpl: GetNotificationUseCase {
    func execute(input: GetNotificationUseCaseParam) async throws -> [Notification] {

        let notifications = Array(0...10).map {
            Notification(id: "id\($0)", time: Date(), title: "Title \($0)", content: "Content \($0)", contentType: .classContent)
        }

        return notifications
    }
}
