//
//  DashboardDependencyFactory.swift
//  EduManager
//
//  Created by TungDVS on 30/08/2024.
//

import Foundation

protocol DashboardDependencyFactory {
    func makeFetchUserInfoUseCase() -> any FetchUserInfoUseCase
    func makeFetchUpcomingEventsUseCase() -> any FetchUpcomingEventsUseCase
    func makeFetchRecentActivitiesUseCase() -> any FetchRecentActivitiesUseCase
}

class DashboardDependencyFactoryPreview: DashboardDependencyFactory {
    func makeFetchUserInfoUseCase() -> any FetchUserInfoUseCase {
        // Return a mock implementation for preview
        return MockFetchUserInfoUseCase()
    }

    func makeFetchUpcomingEventsUseCase() -> any FetchUpcomingEventsUseCase {
        // Return a mock implementation for preview
        return MockFetchUpcomingEventsUseCase()
    }

    func makeFetchRecentActivitiesUseCase() -> any FetchRecentActivitiesUseCase {
        // Return a mock implementation for preview
        return MockFetchRecentActivitiesUseCase()
    }
}

class DashboardDependencyFactoryImpl: DashboardDependencyFactory {
    func makeFetchUserInfoUseCase() -> any FetchUserInfoUseCase {
        // Return the actual implementation
        return FetchUserInfoUseCaseImpl()
    }

    func makeFetchUpcomingEventsUseCase() -> any FetchUpcomingEventsUseCase {
        // Return the actual implementation
        return FetchUpcomingEventsUseCaseImpl()
    }

    func makeFetchRecentActivitiesUseCase() -> any FetchRecentActivitiesUseCase {
        // Return the actual implementation
        return FetchRecentActivitiesUseCaseImpl()
    }
}
