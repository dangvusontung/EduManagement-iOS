//
//  Class.swift
//  EduManager
//
//  Created by TungDVS on 29/08/2024.
//

import Foundation

struct Class {
    let courseId: String
    let courseName: String
    let subject: Subject
    let teacherId: String
    let assistanceId: [String]
    
    let teacherName: String
    let schedule: [CourseSchedule]
    
    let locationId: String
    let location: String
    
}
