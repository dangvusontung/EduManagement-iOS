//
//  Course.swift
//  EduManager
//
//  Created by TungDVS on 25/08/2024.
//

import Foundation

struct Course {
    let name: String
    let startDate: Date
    let endDate: Date
    let teacher: Teacher 
    let assitances: [TeacherAssistance]
    let students: [Student]
}
