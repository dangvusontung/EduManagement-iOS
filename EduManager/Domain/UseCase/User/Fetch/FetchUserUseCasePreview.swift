//
//  FetchUserUseCasePreview.swift
//  EduManager
//
//  Created by TungDVS on 29/08/2024.
//

import Foundation

class FetchUserUseCasePreview: FetchUserUseCase {
    func execute() async throws -> User {
        let url = "https://cdn.iconscout.com/icon/free/png-512/free-dog-icon-download-in-svg-png-gif-file-formats--animal-pet-cute-chinese-new-year-pack-festival-icons-1651762.png?f=webp&w=512"
        return User(name: "Son Tung", email: "dangvusontung@gmail.com", avatarUrl: url, accountType: .admin)
    }
}
