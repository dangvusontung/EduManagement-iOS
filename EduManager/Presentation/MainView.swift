//
//  MainView.swift
//  EduManager
//
//  Created by TungDVS on 28/08/2024.
//

import SwiftUI

struct MainView: View {
    
    let mainTabBarViewFactory: MainTabBarViewFactory
    let userType: AccountType

    @State private var selectedTab: DashboardViewType
    
    init(mainTabBarViewFactory: MainTabBarViewFactory, userType: AccountType) {
        self.mainTabBarViewFactory = mainTabBarViewFactory
        self.userType = userType
        self.selectedTab = userType.items.first ?? .dashboard
        
    }
    
    var body: some View {
        TabView {
            ForEach(userType.items, id: \.self) { viewType in
                mainTabBarViewFactory.view(for: viewType)
                    .tag(viewType)
            }
        }
    }
}
