//
//  ClassView.swift
//  EduManager
//
//  Created by TungDVS on 30/08/2024.
//

import SwiftUI

struct CoursesView: View {
    
    @State var viewModel: CoursesViewModel
    
    var body: some View {
        NavigationStack {
            ListItemView(items: viewModel.items) { item in
                CourseViewItem(course: item)
            }
            .navigationTitle("Courses")
            .listStyle(.grouped)
            .searchable(text: $viewModel.searchText)
        }
       
        
    }
}

#Preview {
    let factory = CoursesDependencyFactoryImpl()
    let viewModel = CoursesViewModel(getCoursesUseCase: factory.makeGetCourseUseCase())
    
    return CoursesView(viewModel: viewModel)
}
