//
//  MainDependencyFactory.swift
//  EduManager
//
//  Created by TungDVS on 29/08/2024.
//

import Foundation

struct MainDependencyFactory {
    func makeMoreViewModel() -> MoreViewModel {
        let factory = MoreDependencyFactoryImpl()
        return MoreViewModel(factory: factory)
    }
    
    func makeCalendarViewModel() -> CalendarViewModel {
        let factory = CalendarDependencyFactoryImpl()
        return CalendarViewModel(factory: factory)
    }

    func makeDashboardViewModel() -> DashboardViewModel {
        let factory = DashboardDependencyFactoryImpl()
        return DashboardViewModel(dashboardDependencyFactory: factory)
    }
    
    func makeNotifcationViewModel() -> NotificationViewModel {
        let factory = NotificationDependencyFactoryImpl()
        return NotificationViewModel(factory: factory)
    }    
    
    func makeCourseViewModel() -> CoursesViewModel {
        let factory = CoursesDependencyFactoryImpl()
        return CoursesViewModel(getCoursesUseCase: factory.makeGetCourseUseCase())
    }
}

