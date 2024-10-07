//
//  ClassDependencyFactory.swift
//  EduManager
//
//  Created by TungDVS on 30/08/2024.
//

import Foundation

protocol CoursesDependencyFactory {
    func makeGetCourseUseCase() -> any GetCoursesUseCase
}
