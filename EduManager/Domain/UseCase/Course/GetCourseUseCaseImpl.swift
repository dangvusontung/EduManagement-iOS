//
//  GetCourseUseCaseImpl.swift
//  EduManager
//
//  Created by TungDVS on 29/08/2024.
//

import Foundation

class GetCoursesUseCaseImpl: GetCoursesUseCase {
    func execute(input: GetCoursesParam) async throws -> [Course] {
                
        let courses = Array(0...10).map {
            Course(id: "id\($0)", name: "Course \($0)", startDate: Date(), subject: .algebra, endDate: Date(), teacher: .mock, assistances: TeacherAssistance.mocks, students: Student.mocks, enrollmentCapacity: 10, enrollmentFee: $0 % 2 == 0 ? 500_000 : nil)
        }
        
        return courses
    }
}
