//
//  AccountTabViewModel.swift
//  HouseParty
//
//  Created by Keith Okuna on 11/6/21.
//

import Foundation

class AccountTabViewModel: ObservableObject {
    @Published var user = User()
    
    var apiService:ApiService
    
    init(apiService: ApiService) {
        self.apiService = apiService;
    }
    
    func getUserData() {
        do {
//            user = try await apiService.getUserData();
        } catch {
            
        }
    }
}
