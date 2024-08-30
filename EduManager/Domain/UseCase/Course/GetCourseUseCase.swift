//
//  GetCourseUseCase.swift
//  EduManager
//
//  Created by TungDVS on 29/08/2024.
//

import Foundation

protocol GetCourseUseCase: UseCase where Input == Int, Output == [Course] {}
