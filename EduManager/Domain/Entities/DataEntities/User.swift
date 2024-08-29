//
//  User.swift
//  EduManager
//
//  Created by TungDVS on 28/08/2024.
//

import Foundation

struct User {
    let name: String
    let email: String
    let avatarUrl: String
    let accountType: AccountType
}

extension User {
    static var empty: User {
        return User(name: "", email: "", avatarUrl: "", accountType: .unknown)
    }
}
