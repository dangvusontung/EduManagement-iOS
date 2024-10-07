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
                .frame(maxWidth: .infinity, alignment: .leading)

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
                Text(event.name)
                    .font(.headline)
                Spacer()
                timeView()
            }
            
            Text(event.startTime.format(using: .dayInWeek))
                .font(.subheadline)
            
            personInChargeView()
                .font(.caption)
                .foregroundStyle(.secondary)

            locationView()
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 0.5)
        )
    }
    
    @ViewBuilder func timeView() -> some View {
        HStack {
            Image(systemName: "clock")
            Text(event.startTime.format(using: .hhMM))
            Text("-")
            Text(event.startTime.format(using: .hhMM))
        }
        .lineLimit(1)
        .font(.caption)
    }
    
    @ViewBuilder func personInChargeView() -> some View {
        HStack {
            Image(systemName: "person.crop.circle")
            Text(event.personInChargeName)
        }
    }
    
    @ViewBuilder func locationView() -> some View {
        if let location = event.location, !location.isEmpty {
            HStack {
                Image(systemName: "mappin.circle")
                Text(location)
            }
        } else {
            EmptyView()
        }
    }
    
}

#Preview {
    let event = ScheduleEvent(id: "", name: "Event demo", courseId: "", startTime: Date(), endTime: Date(), location: "Home", description: "Hello", personInChargeName: "Tung")
    return List {
        ScheduleItemView(event: event)
            .listRowSeparator(.hidden)
        ScheduleItemView(event: event)
            .listRowSeparator(.hidden)
        ScheduleItemView(event: event)
            .listRowSeparator(.hidden)
        ScheduleItemView(event: event)
            .listRowSeparator(.hidden)
        ScheduleItemView(event: event)
            .listRowSeparator(.hidden)
        ScheduleItemView(event: event)
            .listRowSeparator(.hidden)
        ScheduleItemView(event: event)
            .listRowSeparator(.hidden)
    }
    .background(Color.clear)

}
