//
//  Course.swift
//  EduManager
//
//  Created by TungDVS on 25/08/2024.
//

import Foundation

struct Course: Identifiable {
    let id: String
    let name: String
    let startDate: Date
    let subject: Subject
    let endDate: Date
    let teacher: Teacher
    let assistances: [TeacherAssistance]
    let students: [Student]
    let enrollmentCapacity: Int
    let enrollmentFee: Double?
}
