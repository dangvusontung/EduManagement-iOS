//
//  CalendarView.swift
//  EduManager
//
//  Created by TungDVS on 29/08/2024.
//

import SwiftUI

struct CalendarView: View {
    
    @State var viewModel: CalendarViewModel
    
    @State var showSheet = false
    
    var body: some View {
        NavigationStack {
            List(viewModel.events) { event in
                ScheduleItemView(event: event)
            }
            .listStyle(.grouped)
            .navigationTitle("Schedule")
            .navigationBarTitleDisplayMode(.large)
            .searchable(text: $viewModel.searchText)
            .toolbar {
                Button {
                    showSheet.toggle()
                } label: {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                }
            }
            .sheet(isPresented: $showSheet, content: {
                Text("Filter items")
                    .presentationDetents([.medium])
                    .presentationBackground(.thinMaterial)
            })
        }
    }
}

#Preview {
    let viewModel = CalendarViewModel(factory: CalendarDependencyFactoryImpl())
    return CalendarView(viewModel: viewModel)
}
