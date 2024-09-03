//
//  NotificationViewModel.swift
//  EduManager
//
//  Created by TungDVS on 28/08/2024.
//

import Foundation

class NotificationViewModel: PagingViewModel<Notification> {
    
    var startDate: Date?
    var endDate: Date?
    
    // Use Cases
    @ObservationIgnored
    private let getNotificationUseCase: any GetNotificationUseCase
    
    @ObservationIgnored
    private var fetchNotificationTask: Task<Void, Never>?
    
    
    init(factory: NotificationDependencyFactory) {
        getNotificationUseCase = factory.makeGetNotificationUseCase()
        super.init()
    }
    
    override func loadItems() async throws -> [Notification] {
        let param = GetNotificationUseCaseParam(startDate: startDate, endDate: endDate, page: currentPage, itemPerPage: itemsPerPage)
        return try await getNotificationUseCase.execute(input: param)
    }
    
    var notifications: [Notification] {
        items
    }
}
