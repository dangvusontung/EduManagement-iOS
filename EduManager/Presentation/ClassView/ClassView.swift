//
//  ClassView.swift
//  EduManager
//
//  Created by TungDVS on 30/08/2024.
//

import SwiftUI

struct ClassView: View {
    @State var viewModel: ClassViewModel

    var body: some View {
        NavigationStack {
            ClassViewContent(viewModel: viewModel)
                .navigationTitle("Classes")
                .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct ClassViewContent: View {
    let viewModel: ClassViewModel

    var body: some View {
        List {
            Section(header: Text("Current Classes")) {
                ForEach(viewModel.currentClasses, id: \.self) { classItem in
                    Text(classItem)
                }
            }

            Section(header: Text("Upcoming Classes")) {
                ForEach(viewModel.upcomingClasses, id: \.self) { classItem in
                    Text(classItem)
                }
            }

            Section(header: Text("Actions")) {
                Button("View Schedule") {
                    viewModel.viewSchedule()
                }
                Button("View Grades") {
                    viewModel.viewGrades()
                }
            }
        }
        .listStyle(.insetGrouped)
    }
}

struct ClassDependencyFactoryPreview: ClassDependencyFactory {
    func makeClassViewModel() -> ClassViewModel {
        ClassViewModel(
            currentClasses: ["Math 101", "History 202"],
            upcomingClasses: ["Physics 301", "Literature 401"]
        )
    }
}

#Preview {
    let viewModel = ClassViewModel(factory: ClassDependencyFactoryPreview())
    return ClassView(viewModel: viewModel)
}
