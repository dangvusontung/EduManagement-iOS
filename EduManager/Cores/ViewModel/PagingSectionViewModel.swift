//
//  PagingSectionViewModel.swift
//  EduManager
//
//  Created by TungDVS on 02/09/2024.
//

import Foundation

class PagingSectionViewModel<Section, Item>: PagingViewModel<Item>  where Section: Sectionable, Item == Section.Item {
    
    typealias ID = Section.ID
    
    var sectionMap: [ID: Section] = [:]
    
    
    override func handleLoadItemsSuccess(_ items: [Item], loadMore: Bool = false) {
        
    }
    
    func makeSection(items: [Item], groupingRule: (Item) -> ID) -> [Section ]{
        // Clear the previous sections
        sectionMap.removeAll()
        
        // Group items based on the provided grouping rule
        let groupedItems = Dictionary(grouping: items, by: groupingRule)
        
        // Create a new section for each group
//        for (key, itemsInSection) in groupedItems {
//            // Assuming Section has an initializer that takes an ID and a list of items
//            let section = Section(id: key, items: itemsInSection)
//            
//            // Store the section in the sectionMap
//            sectionMap[key] = section
//        }
//        
        return []
    }
    
    var sections: [Section] {
        sectionMap.reduce(into: []) { partialResult, section in
            
        }
    }
}
