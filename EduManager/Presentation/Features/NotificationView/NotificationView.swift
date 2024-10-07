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
            List(viewModel.notifications) { notification in
                NotificationItemView(notification: notification, read: true)
            }
            .listStyle(.grouped)
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.large)
        }

    }
}

#Preview {
    let factory = NotificationDependencyFactoryImpl()
    let viewModel = NotificationViewModel(factory: factory)
    return NotificationView(viewModel: viewModel)
}
