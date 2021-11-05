//
//  User.swift
//  HouseParty
//
//  Created by Keith Okuna on 11/4/21.
//

import Foundation

struct User: Codable, Identifiable {
    var id: String { _id }
    var _id: String
    var email: String
    var password: String
}
