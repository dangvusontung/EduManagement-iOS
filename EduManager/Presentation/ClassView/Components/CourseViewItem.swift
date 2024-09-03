//
//  CourseViewItem.swift
//  EduManager
//
//  Created by TungDVS on 02/09/2024.
//

import SwiftUI

struct CourseViewItem: View {
    let course: Course
    
    var body: some View {
        ZStack {
            content
                .frame(maxWidth: .infinity, alignment: .leading)
            NavigationLink {
                CourseDetailView(course: course)
                    .toolbar(.hidden, for: .tabBar)
            } label: {
                EmptyView()
            }
            .opacity(0)
        }
    }
    
    @ViewBuilder
    var content: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(course.name)
                .font(.headline)
                .lineLimit(1)
            
            Text("\(course.subject)")
                .font(.system(size: 10))
                .padding(4)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .background(Color.blue.opacity(0.1))
            
            HStack {
                Image(systemName: "person.fill")
                Text(course.teacher.name)
                    .font(.subheadline)
            }
            .foregroundColor(.secondary)
            
            HStack {
                Image(systemName: "calendar")
                Text(formatDateRange(start: course.startDate, end: course.endDate))
                    .font(.subheadline)
            }
            .foregroundColor(.secondary)
            
            HStack {
                Image(systemName: "person.3.fill")
                Text("\(course.students.count)/\(course.enrollmentCapacity) Students")
                    .font(.subheadline)
            }
            .foregroundColor(.secondary)
        }
    }
    
    private func formatDateRange(start: Date, end: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        return "\(formatter.string(from: start)) - \(formatter.string(from: end))"
    }
}

#Preview {
    List {
        CourseViewItem(course: Course(
            id: "CS101",
            name: "Introduction to Computer Science",
            startDate: Date(),
            subject: .algebra, // Assuming this is how your Subject enum is set up
            endDate: Date().addingTimeInterval(86400 * 90), // 90 days later
            teacher: .mock,
            assistances: TeacherAssistance.mocks,
            students: Student.mocks,
            enrollmentCapacity: 30,
            enrollmentFee: nil
        ))
    }
    .listStyle(PlainListStyle())
}

