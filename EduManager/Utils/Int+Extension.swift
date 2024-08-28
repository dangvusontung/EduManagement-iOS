//
//  extension.swift
//  EduManager
//
//  Created by TungDVS on 25/08/2024.
//

import Foundation

extension Array where Element == Int {
    func sum() -> Int {
        return reduce(into: 0) { partialResult, element in
            partialResult += element
        }
    }
}
