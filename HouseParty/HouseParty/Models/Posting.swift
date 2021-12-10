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
    var author: PostingAuthor = PostingAuthor()
    var body: String = ""
    var title: String = ""
    var date: String = ""
    var replies: [PostingReply] = []
    var actions: [PostingAction] = []
}

struct PostingAuthor: Codable, Identifiable {
    var id: String? { _id }
    var _id: String?
    var name: String = ""
    var email: String = ""
    var bio: String = ""
}

struct PostingReply: Codable, Identifiable {
    var id: String? { _id }
    var _id: String?
    var author: PostingAuthor = PostingAuthor()
    var action: String = ""
}

struct PostingAction: Codable, Identifiable {
    var id: String? { _id }
    var _id: String?
    var author: PostingAuthor = PostingAuthor()
    var body: String = ""
    var title: String = ""
}
