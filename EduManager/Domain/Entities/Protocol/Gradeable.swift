//
//  Gradeable.swift
//  EduManager
//
//  Created by TungDVS on 25/08/2024.
//

import Foundation

protocol Gradeable {
    func giveGrade(grade: Int,student: Student, course: Course)
}

extension Gradeable {
    func giveGrade(grade: Int,student: Student, course: Course) {
        print("Grade \(grade) has been given to \(student.name) in course \(course.name)")
    }
}
