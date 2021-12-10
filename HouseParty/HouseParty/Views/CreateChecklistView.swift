//
//  CreateChecklistView.swift
//  HouseParty
//
//  Created by Alyssandra Katrina Cabading on 11/4/21.
//
import Foundation
import SwiftUI

struct CreateChecklistView: View {
    @ObservedObject var vm: CreateChecklistViewModel
    
    var checklistTasks: ChecklistTasks
    
    var body: some View {
        VStack {
            HStack{
                Button("Add Task") {
                    Task.init {
                        await vm.save()
                    }
                }
            }
            Section(header: Text("Task")) {
                TextField("Task...", text: $vm.checklist.task)
                    .padding()
                    .background(.white)
                    .cornerRadius(6)
                    .padding(.bottom)
            }
          
            
            Section(header: Text("Notes")) {
                TextEditor(text: $vm.checklist.notes)
                    .cornerRadius(6)
            }
            .padding()
            Section(header: Text("Due Date")) {
                //Date Picker here
            }
            .padding()
        }
        .padding()
        .navigationTitle("Add New Task")
        .background(LinearGradient(gradient: Gradient(colors: [.white, .gray]), startPoint: .top, endPoint: .bottom))    }
}
