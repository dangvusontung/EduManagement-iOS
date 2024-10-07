//
//  StudentModel.swift
//  EduManager
//
//  Created by TungDVS on 29/08/2024.
//

import Foundation
import RealmSwift

final class StudentModel: Object {
    @Persisted var id: String
    @Persisted var name: String
    @Persisted var dateOfBirth: String
    @Persisted var parentId: String
}

extension StudentModel: Codable {}
