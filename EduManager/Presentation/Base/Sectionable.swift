//
//  Sectionable.swift
//  EduManager
//
//  Created by TungDVS on 02/09/2024.
//

import Foundation

protocol Sectionable: Identifiable {
    associatedtype Item: Identifiable
    var header: String { get }
    var items: [Item] { get }
}

