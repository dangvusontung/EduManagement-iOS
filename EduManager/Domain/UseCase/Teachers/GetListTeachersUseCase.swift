//
//  GetListTeachersUseCase.swift
//  EduManager
//
//  Created by TungDVS on 03/09/2024.
//

import Foundation

struct GetListTeacherParam {
    let subject: Subject?
    let branchId: String?
}

protocol GetListTeachersUseCase: UseCase where Input == GetListTeacherParam, Output == [Teacher] {}
