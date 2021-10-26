//
//  ApiService.swift
//  HouseParty
//
//  Created by Keith Okuna on 10/25/21.
//

import Foundation

class ApiService :  NSObject {
    
    
    func getPostings() async -> [Posting] {
        var posting1 = Posting(id: "123", userId: "abc", postBody: "this is a test", postHeading: "this is a heading", postedTime: Date())
        return [posting1]
    }
    
}
