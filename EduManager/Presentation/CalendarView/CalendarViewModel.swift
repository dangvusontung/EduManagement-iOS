//
//  CalendarViewModel.swift
//  EduManager
//
//  Created by TungDVS on 28/08/2024.
//

import Foundation

import Foundation

@Observable
class CalendarViewModel: PagingViewModel<ScheduleEvent> {
    @ObservationIgnored var getScheduleUseCase: any GetScheduleUseCase
    
    var searchText: String = ""
    var startDate: Date
    var endDate: Date
    var loadingMore = false
    
    init(factory: CalendarDependencyFactory) {
        startDate = Date()
        endDate = Date()
        self.getScheduleUseCase = factory.makeGetSchedulerUseCase()
        super.init()
    }
    
    override func loadItems() async throws -> [ScheduleEvent] {
        print("Calendar view load item")
        let params = GetScheduleUseCaseParam(startDate: startDate, endDate: endDate)
        return try await getScheduleUseCase.execute(input: params)
    }
    
    var events: [ScheduleEvent] {
        if searchText.isEmpty {
            return items
        }
        return items.filter { item in
            item.name.lowercased().contains(searchText.lowercased())
        }
    }
    
}
