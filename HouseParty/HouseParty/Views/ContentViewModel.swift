//
//  ContentViewModel.swift
//  HouseParty
//
//  Created by Keith Okuna on 10/25/21.
//

import Foundation

class ContentViewModel: ObservableObject {
    var apiService: ApiService
    @Published var postings = [Posting]()
    
    init(apiService:ApiService) {
        self.apiService = apiService
    }
    
    func getPostings() async {
        do {
            postings = try await apiService.getPostings();
        } catch {
            print(error)
        }
    }
    
}
