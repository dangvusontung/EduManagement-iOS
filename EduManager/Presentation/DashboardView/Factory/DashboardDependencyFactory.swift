//
//  DashboardDependencyFactory.swift
//  EduManager
//
//  Created by TungDVS on 30/08/2024.
//

import Foundation

protocol DashboardDependencyFactory: AnyObject {
    func makeGetDashboardContentUseCase() -> any GetDashboardContentUseCase
}
