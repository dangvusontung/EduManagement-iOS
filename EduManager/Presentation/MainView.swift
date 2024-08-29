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
        Text("Calendar")
            .tabItem {
                Label("Calendar", systemImage: "calendar")
            }
            
    }
    
    @ViewBuilder
    func notificationView() -> some View {
        Text("Notification")
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

#Preview {
    MainView()
}
