//
//  Subjects.swift
//  EduManager
//
//  Created by TungDVS on 25/08/2024.
//

import Foundation

enum Subject: Int {
    case algebra
    case geometry
    case literature
    case physic
    case chemistry
    case english
    case biology
    
}

extension Subject: Identifiable {
    var id: Int {
        self.rawValue
    }
}
