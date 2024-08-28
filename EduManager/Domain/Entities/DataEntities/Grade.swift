//
//  Grade.swift
//  EduManager
//
//  Created by TungDVS on 25/08/2024.
//

import Foundation

enum GradeCoefficient: Int {
    case one = 1
    case two
    case three
}

struct Grade {
    let coefficient: GradeCoefficient
    let value: Int 
}
