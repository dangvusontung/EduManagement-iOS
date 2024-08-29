//
//  DIFactory.swift
//  EduManager
//
//  Created by TungDVS on 29/08/2024.
//

import Foundation

protocol DIFactory {
    associatedtype T
    func make() 
}
