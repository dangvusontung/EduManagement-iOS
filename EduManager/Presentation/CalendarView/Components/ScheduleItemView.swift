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
        ZStack {
            content()
            NavigationLink {
                ScheduleEventDetailView(event: event)
                    .toolbar(.hidden, for: .tabBar)
            } label: {
                EmptyView()
            }
            .opacity(0)
        }
    }
    
    @ViewBuilder
    private func content() -> some View {
        VStack(alignment: .leading, spacing: 8) {

            HStack {
                Text(event.personInChargeName)
                Spacer()
                Text(event.startTime.format(using: .hhMM))
                Text("-")
                Text(event.startTime.format(using: .hhMM))
            }
            .lineLimit(1)
            .font(.caption)
            
            Text(event.name)

            if let description = event.description, !description.isEmpty {
                Text(description)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
            
            if let location = event.location {
                Text(location)
                    .font(.caption)
                    .foregroundColor(.secondary)
                
            }
        }
    }

}

#Preview {
    let event = ScheduleEvent(id: "", name: "Event demo", courseId: "", startTime: Date(), endTime: Date(), location: "Home", description: "Hello", personInChargeName: "Tung")
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
