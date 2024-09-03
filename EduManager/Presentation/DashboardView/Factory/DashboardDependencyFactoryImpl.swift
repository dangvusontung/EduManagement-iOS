//
//  DashboardDependencyFactoryImpl.swift
//  EduManager
//
//  Created by TungDVS on 30/08/2024.
//

import Foundation

class DashboardDependencyFactoryImpl: DashboardDependencyFactory {
    
    func makeGetDashboardContentUseCase() -> any GetDashboardContentUseCase {
        GetDashboardContentUseCaseImpl()
    }
    
    deinit {
        print("Dashboard Dependency factory deinit")
    }
}
