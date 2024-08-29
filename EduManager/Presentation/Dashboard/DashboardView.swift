//
//  DashboardView.swift
//  EduManager
//
//  Created by AI Assistant on 29/08/2024.
//

import SwiftUI

struct DashboardView: View {
    @State var viewModel: DashboardViewModel

    var body: some View {
        DashboardViewContent(viewModel: viewModel)
    }
}

struct DashboardViewContent: View {
    @ObservedObject var viewModel: DashboardViewModel

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Recent Activity")) {
                    ForEach(viewModel.recentActivity) { activity in
                        VStack(alignment: .leading) {
                            Text(activity.description)
                            Text(activity.date, style: .relative)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }

                Section(header: Text("Upcoming Events")) {
                    ForEach(viewModel.upcomingEvents) { event in
                        VStack(alignment: .leading) {
                            Text(event.title)
                            Text(event.date, style: .date)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }

                Section(header: Text("Tasks")) {
                    ForEach(viewModel.tasks) { task in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(task.title)
                                Text("Due: \(task.dueDate, style: .date)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(task.isCompleted ? .green : .gray)
                        }
                    }
                }
            }
            .navigationTitle("Dashboard")
        }
    }
}

#Preview {
    DashboardView(viewModel: DashboardViewModel(factory: PreviewDashboardUseCaseFactory()))
}
