//
//  GradeCalculator.swift
//  EduManager
//
//  Created by TungDVS on 25/08/2024.
//

import Foundation

struct GradeCalculator {
    static func calculateTotalCourseGrade(grades: [Grade]) -> Double {
        let totalCoef = grades.map(\.coefficient.rawValue).sum()
        let totalGrade = grades.reduce(into: 0) { partialResult, grade in
            partialResult += grade.coefficient.rawValue * grade.value
        }
        return Double(totalGrade) / Double(totalCoef)
    }
    
}
