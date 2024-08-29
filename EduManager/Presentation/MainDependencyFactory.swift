//
//  MainDependencyFactory.swift
//  EduManager
//
//  Created by TungDVS on 29/08/2024.
//

import Foundation

struct MainDependencyFactory {
    func makeMoreViewModel() -> MoreViewModel {
#if XCODE_RUNNING_FOR_PREVIEWS
// code for Xcode Previews here
        let factory = MoreUseCaseFactoryPreview()
        return MoreViewModel(factory: factory)
#else
// code for other environments here
        let factory = MoreUseCaseFactoryImpl()
        return MoreViewModel(factory: factory)
#endif
    }

    func makeCalendarViewModel() -> CalendarViewModel {
#if XCODE_RUNNING_FOR_PREVIEWS
        let factory = PreviewCalendarUseCaseFactory()
        return CalendarViewModel(factory: factory)
#else
        let factory = CalendarUseCaseFactoryImpl()
        return CalendarViewModel(factory: factory)
#endif
    }

    func makeDashboardViewModel() -> DashboardViewModel {
#if XCODE_RUNNING_FOR_PREVIEWS
        let factory = PreviewDashboardUseCaseFactory()
        return DashboardViewModel(factory: factory)
#else
        let factory = DashboardUseCaseFactoryImpl()
        return DashboardViewModel(factory: factory)
#endif
    }

    func makeNotificationViewModel() -> NotificationViewModel {
#if XCODE_RUNNING_FOR_PREVIEWS
        let factory = PreviewNotificationUseCaseFactory()
        return NotificationViewModel(factory: factory)
#else
        let factory = NotificationUseCaseFactoryImpl()
        return NotificationViewModel(factory: factory)
#endif
    }
}
