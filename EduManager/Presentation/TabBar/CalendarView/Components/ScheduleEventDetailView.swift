//
//  ScheduleEventDetailView.swift
//  EduManager
//
//  Created by TungDVS on 02/09/2024.
//

import SwiftUI

struct ScheduleEventDetailView: View {
    let event: ScheduleEvent
    
    var body: some View {
        List {
            Text(event.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .listRowSeparator(.hidden)

            detailRow(title: "Course ID", value: event.courseId)
            
            detailRow(title: "Time", value: formatTimeRange(start: event.startTime, end: event.endTime))
            
            if let location = event.location {
                detailRow(title: "Location", value: location)
            }
            
            if let description = event.description {
                detailRow(title: "Description", value: description)
            }
            
            detailRow(title: "Person in Charge", value: event.personInChargeName)
        }
        .listStyle(.plain)
        .frame(maxWidth: .infinity, alignment: .leading)
        .navigationTitle("Event Details")
        .navigationBarTitleDisplayMode(.inline)

    }
    
    private func detailRow(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.headline)
                .foregroundColor(.secondary)
            Text(value)
                .font(.body)
        }
        .listRowSeparator(.hidden)
    }
    
    private func formatTimeRange(start: Date, end: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return "\(formatter.string(from: start)) - \(formatter.string(from: end))"
    }
}

#Preview {
    ScheduleEventDetailView(event: ScheduleEvent(
        id: "1",
        name: "Introduction to SwiftUI",
        courseId: "CS101",
        startTime: Date(),
        endTime: Date().addingTimeInterval(3600),
        location: "Room 201",
        description: "Learn the basics of SwiftUI and how to create beautiful user interfaces.",
        personInChargeName: "John Doe"
    ))
}
