//
//  UseCase.swift
//  EduManager
//
//  Created by TungDVS on 28/08/2024.
//

import Foundation

protocol UseCase {
    associatedtype Input
    associatedtype Output
    
    func execute(input: Input) async throws -> Output 
}

protocol SimpleUseCase {
    associatedtype Output
    func execute() async throws -> Output
}
