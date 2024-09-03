//
//  CourseDetailView.swift
//  EduManager
//
//  Created by TungDVS on 03/09/2024.
//

import SwiftUI

struct CourseDetailView: View {
    let course: Course
    
    var body: some View {
        List {
            Text(course.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            detailRow(title: "Course ID", value: course.id)
            
            detailRow(title: "Start Date", value: course.startDate.format(using: .shortDate))
            detailRow(title: "End Date", value: course.endDate.format(using: .shortDate))
            
            NavigationLink {
                Text("Teacher's info")
            } label: {
                detailRow(title: "Teacher", value: course.teacher.name)
            }
            
            detailRow(title: "Enrollment Capacity", value: "\(course.enrollmentCapacity)")
                
            enrollmentView()
            
            if let fee = course.enrollmentFee {
                detailRow(title: "Fee", value: "\(fee)")
            }
            
            if !course.assistances.isEmpty {
                NavigationLink {
                    List(course.assistances) { assistance in
                        Text("\(assistance.name)")
                    }
                } label: {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Teacher Assistants")
                            .font(.headline)
                            .foregroundStyle(.secondary)
                        Text("\(course.assistances.count) assistances")
                            .font(.body)
                    }
                }
            }
            
            if !course.students.isEmpty {
                NavigationLink {
                    List(course.students) { student in
                        Text("\(student.name)")
                    }
                } label: {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Enrolled Students")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        Text("\(course.students.count) students")
                            .font(.body)
                    }
                    
                }
                
                Spacer()
            }
        }
        .navigationTitle("Course Details")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
    private func enrollmentView() -> some View {
        if course.students.count < course.enrollmentCapacity {
            NavigationLink {
                Text("Enroll screel")
            } label: {
                detailRow(title: "Current Enrollment", value: "\(course.students.count)")
            }
        } else {
            detailRow(title: "Current Enrollment", value: "\(course.students.count)")
        }
        
    }
    
    @ViewBuilder
    private func detailRow(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.headline)
                .foregroundColor(.secondary)
            Text(value)
                .font(.body)
        }
    }
}

#Preview {
    CourseDetailView(course: Course(
        id: "CS101",
        name: "Introduction to Computer Science",
        startDate: Date(),
        subject: .algebra,
        endDate: Date().addingTimeInterval(86400 * 90), // 90 days later
        teacher: .mock,
        assistances: [],
        students:[],
        enrollmentCapacity: 30,
        enrollmentFee: 500000.0
    ))
}
