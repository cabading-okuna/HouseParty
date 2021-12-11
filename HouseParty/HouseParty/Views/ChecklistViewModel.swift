//
//  ChecklistViewModel.swift
//  HouseParty
//
//  Created by Alyssandra Cabading on 11/22/21.
//
import Foundation

class ChecklistViewModel: ObservableObject {
    var apiService: ApiService
    @Published var checklistTasks = [ChecklistTasks]()
    
    init(apiService:ApiService) {
        self.apiService = apiService
    }
    
    func getChecklistTasks() async {
        do {
            checklistTasks = try await apiService.getChecklistTasks();
        } catch {
            print(error)
        }
    }
}
