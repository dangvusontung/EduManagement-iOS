//
//  NotificationModel.swift
//  EduManager
//
//  Created by TungDVS on 29/08/2024.
//

import Foundation
import RealmSwift

class NotificationModel: Object {
    @Persisted var id: String
    @Persisted var title: String
    @Persisted var content: String
}
