//
//  Course.swift
//  EduManager
//
//  Created by TungDVS on 29/08/2024.
//

import Foundation
import RealmSwift

class CourseModel: Object {
    @Persisted var id: String
    @Persisted var name: String
    @Persisted var startDate: Date
    @Persisted var endDate: Date
    @Persisted var subjectId: Int
    @Persisted var teacher: TeacherModel
    @Persisted var students: List<StudentModel>
}
