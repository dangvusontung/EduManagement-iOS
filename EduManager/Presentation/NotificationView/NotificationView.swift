//
//  NotificationView.swift
//  EduManager
//
//  Created by TungDVS on 30/08/2024.
//

import SwiftUI

struct NotificationView: View {
    @State var viewModel: NotificationViewModel

    var body: some View {
        NavigationStack {
            NotificationViewContent(viewModel: viewModel)
                .navigationTitle("Notifications")
                .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct NotificationViewContent: View {
    let viewModel: NotificationViewModel

    var body: some View {
        List {
            Section(header: Text("New Notifications")) {
                ForEach(viewModel.newNotifications, id: \.self) { notification in
                    Text(notification)
                }
            }

            Section(header: Text("Earlier")) {
                ForEach(viewModel.earlierNotifications, id: \.self) { notification in
                    Text(notification)
                }
            }
        }
        .listStyle(.insetGrouped)
    }
}

struct NotificationDependencyFactoryPreview: NotificationDependencyFactory {
    func makeNotificationViewModel() -> NotificationViewModel {
        NotificationViewModel(
            newNotifications: ["New assignment posted", "Upcoming exam reminder"],
            earlierNotifications: ["Grade posted for Math quiz", "Class schedule changed"]
        )
    }
}

#Preview {
    let viewModel = NotificationViewModel(factory: NotificationDependencyFactoryPreview())
    return NotificationView(viewModel: viewModel)
}
