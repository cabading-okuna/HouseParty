//
//  CreatePostModel.swift
//  HouseParty
//
//  Created by Alyssandra Katrina Cabading on 11/4/21.
//
import Foundation

class CreatePostViewModel: ObservableObject{
    
    @Published var post = Posting()

    var apiService: ApiService
    
    init(apiService:ApiService) {
        self.apiService = apiService
    }
    
    func save() async {
        do {
            try await apiService.createPosting(newPosting: post)
        }
        catch {
            
        }
    }
    
    func close() {
        
    }
    
    func createPost(){
    }
}
