//
//  EduManagerApp.swift
//  EduManager
//
//  Created by TungDVS on 25/08/2024.
//

import SwiftUI

@main
struct EduManagerApp: App {
    
    init() {
        registerDependencies()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    func registerDependencies() {
        let container = DependencyContainer.shared
        container.registerFactory(
            ((any FetchUserUseCase).self, { FetchUserUseCaseImpl() })
            
        )
    }
}
