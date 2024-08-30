//
//  ScheduleItemView.swift
//  EduManager
//
//  Created by TungDVS on 30/08/2024.
//

import SwiftUI

struct ScheduleItemView: View {
    
    var event: ScheduleEvent
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(event.name)
                .font(.title)
            
            HStack {
                Text("From: \(formattedTime(event.startTime))")
                Spacer()
                Text("To: \(formattedTime(event.endTime))")
            }
            .lineLimit(1)
            .font(.callout)
            
            if let location = event.location {
                Text(location)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
            }
            if let description = event.description, !description.isEmpty {
                Text(description)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .shadow(radius: 1)
    }
    
    private func formattedTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

#Preview {
    let event = ScheduleEvent(id: "", name: "Event demo", courseId: "", startTime: Date(), endTime: Date(), location: "Home", description: "Hello")
    return List {
        ScheduleItemView(event: event)
        ScheduleItemView(event: event)
        ScheduleItemView(event: event)
        ScheduleItemView(event: event)
        ScheduleItemView(event: event)
        ScheduleItemView(event: event)
        ScheduleItemView(event: event)
    }.listRowSeparator(.hidden)
}
