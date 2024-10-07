//
//  ClassDependencyFactoryImpl.swift
//  EduManager
//
//  Created by TungDVS on 30/08/2024.
//

import Foundation

class CoursesDependencyFactoryImpl: CoursesDependencyFactory {
    
    func makeGetCourseUseCase() -> any GetCoursesUseCase {
        return GetCoursesUseCaseImpl()
    }
}
