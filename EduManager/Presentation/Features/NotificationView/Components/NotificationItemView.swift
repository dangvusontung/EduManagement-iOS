//
//  NotificationItemView.swift
//  EduManager
//
//  Created by TungDVS on 01/09/2024.
//

import SwiftUI

struct NotificationItemView: View {
    
    let notification: Notification
    let read: Bool
    
    var body: some View {
        HStack(alignment: .top){
            VStack(alignment: .leading) {
                Text(notification.title)
                    .font(.headline)
                Text(notification.content)
            }
            Spacer()
            Text(notification.time.format(using: .shortDate))
                .font(.caption)
        }
        .frame(height: 56)
    }
}

#Preview {
    let notifcation = Notification(id: "", time: Date(), title: "Notification", content: "Some class are in due today", contentType: .classContent)
    return List {
        NotificationItemView(notification: notifcation, read: true)
        NotificationItemView(notification: notifcation, read: false)
    }
    .listStyle(.grouped)
}
