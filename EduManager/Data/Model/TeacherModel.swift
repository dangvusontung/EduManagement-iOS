//
//  TeacherModel.swift
//  EduManager
//
//  Created by TungDVS on 29/08/2024.
//

import Foundation
import RealmSwift

class TeacherModel: Object {
    @Persisted var id: String
    @Persisted var name: String
    @Persisted var dateOfBirth: Date
}
