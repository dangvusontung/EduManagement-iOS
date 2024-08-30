//
//  ClassDependencyFactory.swift
//  EduManager
//
//  Created by TungDVS on 30/08/2024.
//

import Foundation

protocol ClassDependencyFactory {
    func makeFetchCurrentClassesUseCase() -> any FetchCurrentClassesUseCase
    func makeFetchUpcomingClassesUseCase() -> any FetchUpcomingClassesUseCase
    func makeViewScheduleUseCase() -> any ViewScheduleUseCase
    func makeViewGradesUseCase() -> any ViewGradesUseCase
}

class ClassDependencyFactoryPreview: ClassDependencyFactory {
    func makeFetchCurrentClassesUseCase() -> any FetchCurrentClassesUseCase {
        // Return a mock implementation for preview
        return MockFetchCurrentClassesUseCase()
    }

    func makeFetchUpcomingClassesUseCase() -> any FetchUpcomingClassesUseCase {
        // Return a mock implementation for preview
        return MockFetchUpcomingClassesUseCase()
    }

    func makeViewScheduleUseCase() -> any ViewScheduleUseCase {
        // Return a mock implementation for preview
        return MockViewScheduleUseCase()
    }

    func makeViewGradesUseCase() -> any ViewGradesUseCase {
        // Return a mock implementation for preview
        return MockViewGradesUseCase()
    }
}

class ClassDependencyFactoryImpl: ClassDependencyFactory {
    func makeFetchCurrentClassesUseCase() -> any FetchCurrentClassesUseCase {
        // Return the actual implementation
        return FetchCurrentClassesUseCaseImpl()
    }

    func makeFetchUpcomingClassesUseCase() -> any FetchUpcomingClassesUseCase {
        // Return the actual implementation
        return FetchUpcomingClassesUseCaseImpl()
    }

    func makeViewScheduleUseCase() -> any ViewScheduleUseCase {
        // Return the actual implementation
        return ViewScheduleUseCaseImpl()
    }

    func makeViewGradesUseCase() -> any ViewGradesUseCase {
        // Return the actual implementation
        return ViewGradesUseCaseImpl()
    }
}
