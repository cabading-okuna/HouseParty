//
//  CreatePostModel.swift
//  HouseParty
//
//  Created by Alyssandra Katrina Cabading on 11/4/21.
//
import Foundation

class CreatePostModel: ObservableObject{
    
    @Published var postings = [Posting]()

    var apiService: ApiService
    
    init(apiService:ApiService) {
        self.apiService = apiService
    }
    

    func createPost(){
    }
}
