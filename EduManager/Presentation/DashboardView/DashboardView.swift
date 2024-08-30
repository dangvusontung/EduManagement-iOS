//
//  DashboardView.swift
//  EduManager
//
//  Created by TungDVS on 30/08/2024.
//

import SwiftUI

struct DashboardView: View {
    @State var viewModel: DashboardViewModel

    var body: some View {
        NavigationStack {
            DashboardViewContent(viewModel: viewModel)
                .navigationTitle("Dashboard")
                .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct DashboardViewContent: View {
    let viewModel: DashboardViewModel

    var body: some View {
        List {
            Section(header: Text("Welcome")) {
                Text("Hello, \(viewModel.userName)!")
                    .font(.headline)
            }

            Section(header: Text("Upcoming Events")) {
                ForEach(viewModel.upcomingEvents, id: \.self) { event in
                    Text(event)
                }
            }

            Section(header: Text("Recent Activities")) {
                ForEach(viewModel.recentActivities, id: \.self) { activity in
                    Text(activity)
                }
            }

            Section(header: Text("Quick Actions")) {
                Button("View Schedule") {
                    viewModel.viewSchedule()
                }
                Button("Check Grades") {
                    viewModel.checkGrades()
                }
            }
        }
        .listStyle(.insetGrouped)
    }
}

struct DashboardDependencyFactoryPreview: DashboardDependencyFactory {
    func makeDashboardViewModel() -> DashboardViewModel {
        DashboardViewModel(
            userName: "John Doe",
            upcomingEvents: ["Math Exam - Tomorrow", "Project Deadline - Next Week"],
            recentActivities: ["Submitted English Essay", "Attended Science Lab"]
        )
    }
}

#Preview {
    let viewModel = DashboardViewModel(factory: DashboardDependencyFactoryPreview())
    return DashboardView(viewModel: viewModel)
}
