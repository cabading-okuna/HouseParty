//
//  Posting.swift
//  HouseParty
//
//  Created by Keith Okuna on 10/25/21.
//

import Foundation

struct Posting: Codable, Identifiable {
    var id: String
    var userId: String
    var postBody: String
    var postHeading: String
    var postedTime: Date
}
