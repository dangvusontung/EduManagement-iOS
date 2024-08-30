//
//  MainDependencyFactory.swift
//  EduManager
//
//  Created by TungDVS on 29/08/2024.
//

import Foundation

struct MainDependencyFactory {
    func makeMoreViewModel() -> MoreViewModel {
        if isPreview {
            let factory = MoreDependencyFactoryPreview()
            return MoreViewModel(factory: factory)
        } else {
            let factory = MoreDependencyFactoryImpl()
            return MoreViewModel(factory: factory)
        }
    }
    
    
    func makeCalendarViewModel() -> CalendarViewModel {
        if isPreview {
            let factory = CalendarDependencyPreview()
            return CalendarViewModel(factory: factory)
        } else {
            let factory = CalendarDependencyFactoryImpl()
            return CalendarViewModel(factory: factory)
        }
    }
    
    var isPreview: Bool {
        ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
}
