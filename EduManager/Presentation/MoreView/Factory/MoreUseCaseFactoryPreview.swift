//
//  MoreUseCaseFactoryPreview.swift
//  EduManager
//
//  Created by TungDVS on 29/08/2024.
//

import Foundation

class MoreUseCaseFactoryPreview: MoreUseCaseFactory {
    func makeFetchUserUseCase() -> any FetchUserUseCase {
        FetchUserUseCasePreview()
    }
    
    func makeLogOutUseCase() -> any LogOutUseCase {
        LogOutUseCasePreview()
    }
}
