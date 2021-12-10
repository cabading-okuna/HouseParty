//
//  ChecklistViewModel.swift
//  HouseParty
//
//  Created by Alyssandra Cabading on 11/22/21.
//
import Foundation

class ChecklistViewModel: ObservableObject {
    var apiService: ApiService
//    @Published var checklistTasks = [ChecklistTasks]()
    
    init(apiService:ApiService) {
        self.apiService = apiService
    }
    
    func getChecklists() async {
        do {
//            var postings = try await apiService.getChecklists();
        } catch {
            print(error)
        }
    }
}
