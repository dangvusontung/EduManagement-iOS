//
//  MainView.swift
//  EduManager
//
//  Created by TungDVS on 28/08/2024.
//

import SwiftUI

struct MainView: View {
    
    let dependencyFactory = MainDependencyFactory()
    
    var body: some View {
        TabView {
            dashboardView()
            calendarView()
            courseView()
            notificationView()
            moreview()
        }
    }
    
    @ViewBuilder
    func dashboardView() -> some View {
        Text("Dashboard")
            .tabItem {
                Label("Dashboard", systemImage: "newspaper.fill")
            }

    }
    
    @ViewBuilder
    func calendarView() -> some View {
        let viewModel = dependencyFactory.makeCalendarViewModel()
        CalendarView(viewModel: viewModel)
            .tabItem {
                Label("Calendar", systemImage: "calendar")
            }
            
    }
    
    @ViewBuilder
    func courseView() -> some View {
        let viewModel = dependencyFactory.makeCourseViewModel()
        CoursesView(viewModel: viewModel)
            .tabItem {
                Label("My Class", systemImage: "list.clipboard.fill")
            }
    }
    
    @ViewBuilder
    func notificationView() -> some View {
        let viewModel = dependencyFactory.makeNotifcationViewModel()
        
        NotificationView(viewModel: viewModel)
            .tabItem {
                Label("Notification", systemImage: "envelope.badge.fill")
            }

    }
    
    @ViewBuilder
    func moreview() -> some View {
        let viewModel = dependencyFactory.makeMoreViewModel()
        MoreView(viewModel: viewModel)
            .tabItem {
                Label("More", systemImage: "ellipsis")
            }
    }
}
