//
//  CalendarView.swift
//  EduManager
//
//  Created by TungDVS on 29/08/2024.
//

import SwiftUI

struct CalendarView: View {
    
    @State var viewModel: CalendarViewModel
    
    var body: some View {
        NavigationStack {
            List(viewModel.events) { event in
                ScheduleItemView(event: event)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.grouped)
            .navigationTitle("Calendar")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    let viewModel = CalendarViewModel(factory: CalendarDependencyPreview())
    return CalendarView(viewModel: viewModel)
}
