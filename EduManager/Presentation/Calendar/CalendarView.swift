//
//  CalendarView.swift
//  EduManager
//
//  Created by AI Assistant on 29/08/2024.
//

import SwiftUI

struct CalendarView: View {
    @State var viewModel: CalendarViewModel

    var body: some View {
        CalendarViewContent(viewModel: viewModel)
    }
}

struct CalendarViewContent: View {
    @ObservedObject var viewModel: CalendarViewModel

    var body: some View {
        VStack {
            Text("Calendar View")
                .font(.largeTitle)
                .padding()

            DatePicker("Select Date", selection: $viewModel.selectedDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()

            List {
                ForEach(viewModel.events) { event in
                    Text(event.title)
                }
            }
        }
    }
}

#Preview {
    CalendarView(viewModel: CalendarViewModel(factory: PreviewCalendarUseCaseFactory()))
}
