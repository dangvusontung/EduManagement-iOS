//
//  ViewModelState.swift
//  EduManager
//
//  Created by TungDVS on 01/09/2024.
//

import Foundation

enum ViewModelState {
    case idle
    case loading
    case success
    case failure(Error)
}
