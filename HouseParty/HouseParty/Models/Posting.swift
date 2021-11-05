//
//  Posting.swift
//  HouseParty
//
//  Created by Keith Okuna on 10/25/21.
//

import Foundation

struct Posting: Codable, Identifiable {
    var id: String? { _id }
    var _id: String?
    var userId: String = ""
    var body: String = ""
    var title: String = ""
    var date: Int = 0
}
