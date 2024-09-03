//
//  DashboardContent.swift
//  EduManager
//
//  Created by TungDVS on 02/09/2024.
//

import Foundation

enum DashboardContentType {
    case comingClass
    case centerNews
    case scoreReport
    
//    var associatedContnet:
}


struct DashboardContent: Identifiable {
    let id: String
    let title: String
    let type: DashboardContentType
    let associatedContentId: String
}
