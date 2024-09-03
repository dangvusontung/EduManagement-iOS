//
//  SectionableListItem.swift
//  EduManager
//
//  Created by TungDVS on 02/09/2024.
//

import SwiftUI

struct SectionableListItem<
    SectionModel: Sectionable,
    HeaderView: View,
    ItemView: View
>: View {
    
    var sections: [SectionModel]
    @ViewBuilder var header: (SectionModel) -> HeaderView
    @ViewBuilder var sectionItem: (SectionModel.Item) -> ItemView
    
    
    var body: some View {
        ForEach(sections) { section in
            Section {
                ForEach(section.items) {
                    sectionItem($0)
                }
            } header: {
                header(section)
            }
        }
    }
}
