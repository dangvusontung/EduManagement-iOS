//
//  MoreUseCaseFactoryImpl.swift
//  EduManager
//
//  Created by TungDVS on 29/08/2024.
//

import Foundation

class MoreUseCaseFactoryImpl: MoreUseCaseFactory {
    func makeFetchUserUseCase() -> any FetchUserUseCase {
        FetchUserUseCaseImpl()
    }
    
    func makeLogOutUseCase() -> any LogOutUseCase {
        LogOutUseCaseImpl()
    }
}
