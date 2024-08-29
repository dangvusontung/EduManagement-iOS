//
//  DashboardViewModel.swift
//  EduManager
//
//  Created by AI Assistant on 29/08/2024.
//

import Foundation

@Observable
class DashboardViewModel {
    var recentActivity: [Activity] = []
    var upcomingEvents: [Event] = []
    var tasks: [Task] = []

    @ObservationIgnored private var fetchDashboardDataUseCase: any FetchDashboardDataUseCase

    init(factory: DashboardUseCaseFactory) {
        self.fetchDashboardDataUseCase = factory.makeFetchDashboardDataUseCase()
        Task {
            try await fetchDashboardData()
        }
    }

    func fetchDashboardData() async throws {
        let dashboardData = try await fetchDashboardDataUseCase.execute()
        recentActivity = dashboardData.recentActivity
        upcomingEvents = dashboardData.upcomingEvents
        tasks = dashboardData.tasks
    }
}

// MARK: - Models

struct Activity: Identifiable {
    let id: UUID
    let description: String
    let date: Date
}

struct Event: Identifiable {
    let id: UUID
    let title: String
    let date: Date
}

struct Task: Identifiable {
    let id: UUID
    let title: String
    let dueDate: Date
    let isCompleted: Bool
}

struct DashboardData {
    let recentActivity: [Activity]
    let upcomingEvents: [Event]
    let tasks: [Task]
}

// MARK: - Use Cases

protocol DashboardUseCaseFactory {
    func makeFetchDashboardDataUseCase() -> any FetchDashboardDataUseCase
}

protocol FetchDashboardDataUseCase {
    func execute() async throws -> DashboardData
}

// MARK: - Preview Helpers

struct PreviewDashboardUseCaseFactory: DashboardUseCaseFactory {
    func makeFetchDashboardDataUseCase() -> any FetchDashboardDataUseCase {
        PreviewFetchDashboardDataUseCase()
    }
}

struct PreviewFetchDashboardDataUseCase: FetchDashboardDataUseCase {
    func execute() async throws -> DashboardData {
        return DashboardData(
            recentActivity: [
                Activity(id: UUID(), description: "Completed Math Assignment", date: Date()),
                Activity(id: UUID(), description: "Attended Science Lecture", date: Date().addingTimeInterval(-3600))
            ],
            upcomingEvents: [
                Event(id: UUID(), title: "History Exam", date: Date().addingTimeInterval(86400)),
                Event(id: UUID(), title: "Group Project Meeting", date: Date().addingTimeInterval(172800))
            ],
            tasks: [
                Task(id: UUID(), title: "Submit English Essay", dueDate: Date().addingTimeInterval(259200), isCompleted: false),
                Task(id: UUID(), title: "Review Chemistry Notes", dueDate: Date().addingTimeInterval(345600), isCompleted: false)
            ]
        )
    }
}
