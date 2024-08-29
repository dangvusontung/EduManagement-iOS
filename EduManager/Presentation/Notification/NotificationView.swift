//
//  NotificationView.swift
//  EduManager
//
//  Created by AI Assistant on 29/08/2024.
//

import SwiftUI

struct NotificationView: View {
    @State var viewModel: NotificationViewModel

    var body: some View {
        NotificationViewContent(viewModel: viewModel)
    }
}

struct NotificationViewContent: View {
    @ObservedObject var viewModel: NotificationViewModel

    var body: some View {
        VStack {
            Text("Notifications")
                .font(.largeTitle)
                .padding()

            List {
                ForEach(viewModel.notifications) { notification in
                    Text(notification.message)
                }
            }
        }
    }
}

#Preview {
    NotificationView(viewModel: NotificationViewModel(factory: PreviewNotificationUseCaseFactory()))
}

