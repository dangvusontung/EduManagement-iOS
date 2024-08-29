//
//  CalendarViewModel.swift
//  EduManager
//
//  Created by TungDVS on 28/08/2024.
//

import Foundation

@Observable
class CalendarViewModel {
    var selectedDate: Date = Date()
    var events: [Event] = []

    @ObservationIgnored private var fetchEventsUseCase: any FetchEventsUseCase

    init(factory: CalendarUseCaseFactory) {
        self.fetchEventsUseCase = factory.makeFetchEventsUseCase()
        Task {
            try await fetchEvents()
        }
    }

    func fetchEvents() async throws {
        events = try await fetchEventsUseCase.execute(for: selectedDate)
    }
}

// MARK: - Models

struct Event: Identifiable {
    let id: UUID
    let title: String
    let date: Date
}

// MARK: - Use Cases

protocol CalendarUseCaseFactory {
    func makeFetchEventsUseCase() -> any FetchEventsUseCase
}

protocol FetchEventsUseCase {
    func execute(for date: Date) async throws -> [Event]
}

// MARK: - Preview Helpers

struct PreviewCalendarUseCaseFactory: CalendarUseCaseFactory {
    func makeFetchEventsUseCase() -> any FetchEventsUseCase {
        PreviewFetchEventsUseCase()
    }
}

struct PreviewFetchEventsUseCase: FetchEventsUseCase {
    func execute(for date: Date) async throws -> [Event] {
        return [
            Event(id: UUID(), title: "Team Meeting", date: date),
            Event(id: UUID(), title: "Project Deadline", date: date.addingTimeInterval(3600)),
            Event(id: UUID(), title: "Lunch with Client", date: date.addingTimeInterval(7200))
        ]
    }
}
