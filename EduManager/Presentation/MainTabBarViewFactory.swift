//
//  MainTabBarViewFactory.swift
//  EduManager
//
//  Created by TungDVS on 21/9/24.
//

import Foundation
import SwiftUI

class MainTabBarViewFactory {
    
    private let dependencyFactory: MainDependencyFactory
    
    init(dependencyFactory: MainDependencyFactory = .init()) {
        self.dependencyFactory = dependencyFactory
    }
    
    @ViewBuilder func view(for viewType: DashboardViewType) -> some View {
        switch viewType {
        case .dashboard:
            dashboardView()
        case .classManagement:
            classManagementView()
        case .myClass:
            myClassView()
        case .schedule:
            scheduleView()
        case .myLearningRecord:
            myLearningRecordView()
        case .finacialReport:
            financialReportView()
        case .salaryReport:
            salaryReportView()
        case .ranking:
            rankingView()
        case .moreMenu:
            moreView()
        }
    }
    
    @ViewBuilder
    func dashboardView() -> some View {
        DashboardView()
            .tabItem {
                VStack {
                    Image(systemName: "square.3.layers.3d.down.forward")
                        .font(.title)
                    Text("Dashboard")
                }
            }
    }
    
    @ViewBuilder func classManagementView() -> some View {
        EmptyView()
            .tabItem {
                VStack {
                    Image(systemName: "book.fill")
                        .font(.title)
                    Text("Class Management")
                }
            }
    }
    
    @ViewBuilder func myClassView() -> some View {
        EmptyView()
            .tabItem {
                VStack {
                    Image(systemName: "person.crop.circle.badge.checkmark")
                        .font(.title)
                    Text("My Class")
                }
            }
    }
    
    @ViewBuilder func scheduleView() -> some View {
        CalendarView(viewModel: dependencyFactory.makeCalendarViewModel())
            .tabItem {
                VStack {
                    Image(systemName: "calendar")
                        .font(.title)
                        Text("Schedule")
                }
            }
    }
    
    @ViewBuilder func myLearningRecordView() -> some View {
        EmptyView()
            .tabItem {
                VStack {
                    Image(systemName: "chart.bar.fill")
                        .font(.title)
                    Text("My Learning Record")
                }
            }
    }
    
    @ViewBuilder func financialReportView() -> some View {
        Text("Financial Report View")
            .tabItem {
                VStack {
                    Image(systemName: "chart.pie.fill")
                        .font(.title)
                    Text("Financial Report")
                }
            }
    }
    
    @ViewBuilder func salaryReportView() -> some View {
        EmptyView()
            .tabItem {
                VStack {
                    Image(systemName: "dollarsign.circle.fill")
                        .font(.title)
                    Text("Salary Report")
                }
            }
    }
    
    @ViewBuilder func rankingView() -> some View {
        EmptyView()
            .tabItem {
                VStack {
                    Image(systemName: "list.bullet")
                        .font(.title)
                    Text("Ranking")
                }
            }
    }
    
    @ViewBuilder func moreView() -> some View {
        MoreView(viewModel: dependencyFactory.makeMoreViewModel())
            .tabItem {
                VStack {
                    Image(systemName: "ellipsis.circle.fill")
                        .font(.title)
                    Text("More")
                }
            }
    }
   
}
