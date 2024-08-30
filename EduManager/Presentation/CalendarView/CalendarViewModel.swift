//
//  CalendarViewModel.swift
//  EduManager
//
//  Created by TungDVS on 28/08/2024.
//

import Foundation

import Foundation

@Observable
class CalendarViewModel {
    @ObservationIgnored var getScheduleUseCase: any GetScheduleUseCase
    @ObservationIgnored var fetchEventTask: Task<Void, Never>?
    
    var events: [ScheduleEvent] = []
    var startDate: Date
    var endDate: Date
    var loadingMore = false
    
    init(factory: CalendarDependencyFactory) {
        startDate = Date()
        endDate = Date()
        self.getScheduleUseCase = factory.makeGetSchedulerUseCase()
        
        fetchEventTask = Task {
            await fetchEvents()
        }
    }
    
    private func fetchEvents() async {
        do {
            let params = GetScheduleUseCaseParam(startDate: startDate, endDate: endDate)
            let fetchedEvents = try await getScheduleUseCase.execute(input: params)
            print("event fetch success \(fetchedEvents)")
            events = fetchedEvents // Update the events property with fetched events
        } catch {
            print("Error fetching events: \(error)") // Improved error message
        }
    }
    
    // Method to cancel the fetch task if needed
    func cancelFetchEventTask() {
        fetchEventTask?.cancel() // Cancel the task if it's running
        fetchEventTask = nil // Clear the reference
    }
}
