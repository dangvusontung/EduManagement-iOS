//
//  BaseListView.swift
//  EduManager
//
//  Created by TungDVS on 02/09/2024.
//

import SwiftUI

struct ListItemView<Item: Identifiable, ItemView: View>: View {
    
    let items: [Item]
    @ViewBuilder let buildItemView: (Item) -> ItemView
        
    var body: some View {
        List(items) { item in
            buildItemView(item)
        }
    }
}
