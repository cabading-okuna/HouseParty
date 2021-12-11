//
//  ChecklistTasks.swift
//  HouseParty
//
//  Created by Alyssandra Cabading on 11/22/21.
//

import Foundation

struct ChecklistTasks: Codable, Identifiable {
    var id: String? { _id }
    var _id: String?
    var userId: String = ""
    var task: String = ""
    var notes: String = ""
}
