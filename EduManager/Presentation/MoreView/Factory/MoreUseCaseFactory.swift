//
//  MoreUseCaseFactory.swift
//  EduManager
//
//  Created by TungDVS on 29/08/2024.
//

import Foundation

protocol MoreUseCaseFactory {
    func makeFetchUserUseCase() -> any FetchUserUseCase
    func makeLogOutUseCase() -> any LogOutUseCase
}
