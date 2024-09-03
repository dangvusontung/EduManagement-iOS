//
//  GetCourseUseCase.swift
//  EduManager
//
//  Created by TungDVS on 29/08/2024.
//

import Foundation

struct GetCoursesParam {
    
}

protocol GetCoursesUseCase: UseCase where Input == GetCoursesParam, Output == [Course] {}
