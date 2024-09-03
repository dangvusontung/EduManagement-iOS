//
//  MoreVIew.swift
//  EduManager
//
//  Created by TungDVS on 28/08/2024.
//

import SwiftUI

struct MoreView: View {
    
    @State var viewModel: MoreViewModel
    
    var body: some View {
        NavigationStack {
            MoreViewContent(user: viewModel.user)
        }
    }
}
