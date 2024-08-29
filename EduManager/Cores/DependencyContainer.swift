//
//  DependencyContainer.swift
//  EduManager
//
//  Created by TungDVS on 29/08/2024.
//

import Foundation

class DependencyContainer {
    
    static let shared = DependencyContainer()
    
    private init() {}
    
    private var dependencies: [String: Any] = [:]
    private var factories: [String: () -> Any] = [:]
    
    // Variadic function to register multiple dependencies
    func register(_ registrations: (any Any.Type, Any)...) {
        for (type, instance) in registrations {
            let key = String(describing: type)
            dependencies[key] = instance
        }
    }
    
    // Variadic function to register multiple factory closures
    func registerFactory(_ registrations: (any Any.Type, () -> Any)...) {
        for (type, factory) in registrations {
            let key = String(describing: type)
            factories[key] = factory
        }
    }
    
    func resolve<T>() -> T? {
        let key = String(describing: T.self)
        if let dependency = dependencies[key] as? T {
            return dependency
        }
        if let factory = factories[key] {
            return factory() as? T
        }
        return nil
    }
}
