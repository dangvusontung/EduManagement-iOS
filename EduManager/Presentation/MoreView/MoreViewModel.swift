//
//  MoreViewModel.swift
//  EduManager
//
//  Created by TungDVS on 28/08/2024.
//

import Foundation

@Observable
class MoreViewModel {
    
    var user: User = .empty
    
    @ObservationIgnored var fetchUserUseCase: any FetchUserUseCase
    
    init(factory: MoreUseCaseFactory) {
        self.fetchUserUseCase = factory.makeFetchUserUseCase()
        Task {
            try await fetchUser()
        }
    }
    
    func fetchUser() async throws {
        user = try await fetchUserUseCase.execute()
    }
    
    func logOut() async throws {
        
    }
}
