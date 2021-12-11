//
//  CreateChecklistViewModel.swift
//  HouseParty
//
//  Created by Alyssandra Katrina Cabading on 12/9/21.
//

import Foundation

class CreateChecklistViewModel: ObservableObject{
    
    @Published var checklist = ChecklistTasks()

    var apiService: ApiService
    
    init(apiService:ApiService) {
        self.apiService = apiService
    }
    
    func save() async {
        do {
            try await apiService.createChecklistTasks(newChecklistTasks: checklist)
        }
        catch {
            
        }
    }
    
    func close() {
        
    }
    
    func createChecklistTasks(){
    }
}
