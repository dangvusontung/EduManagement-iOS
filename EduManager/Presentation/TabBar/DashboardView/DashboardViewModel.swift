//
//  DashboardViewModel.swift
//  EduManager
//
//  Created by TungDVS on 30/08/2024.
//

import Foundation

@Observable
class DashboardViewModel: BaseViewModel {
    
    @ObservationIgnored let getDashboardContentUseCase: any GetDashboardContentUseCase
    
    var dashboardContent: [DashboardContent] = []
    
    init(dashboardDependencyFactory: DashboardDependencyFactory) {
        self.getDashboardContentUseCase = dashboardDependencyFactory.makeGetDashboardContentUseCase()
        super.init()
        startTask(identifier: TaskIdentifier.loadOnStart) { [weak self] in
            guard let self = self else { return }
            let contents = try await self.getDashboardContentUseCase.execute()
            await self.handleGetDashboardContentComplete(contents: contents)
        }
    }
    
    @MainActor
    private func handleGetDashboardContentComplete(contents: [DashboardContent]) {
        self.dashboardContent = contents
    }
}
