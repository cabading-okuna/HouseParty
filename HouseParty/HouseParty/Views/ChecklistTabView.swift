//
//  ChecklistView.swift
//  HouseParty
//
//  Created by Alyssandra Katrina Cabading on 10/23/21.
//

import SwiftUI

struct ChecklistTabView: View {
    @ObservedObject var viewModel: ChecklistViewModel
    let createChecklistView: CreateChecklistView;

    var body: some View {
        NavigationView{
            VStack(alignment: .center, spacing: 0){
                HStack{
                ChecklistButton(with: createChecklistView)
                }
            List(viewModel.checklistTasks) { checklistTasks in
                ChecklistRow(checklistTasks: checklistTasks)
            }
            .task {
                await viewModel.getChecklistTasks()
            }
        }.refreshable {
            Task.init{
                await viewModel.getChecklistTasks()
            }
            }
            }
            .navigationBarTitle("Checklist", displayMode: .inline)
            .padding(.all, 15.0)
        }
    }

struct ChecklistButton: View{
    @State private var showingPopover = false
    let createChecklistView: CreateChecklistView
    init (with createChecklistView:CreateChecklistView) {
        self.createChecklistView = createChecklistView
    }
    var body: some View{
        Section{
            Button(action: {
                showingPopover = true;
            } ) {
                    VStack(alignment: .center, spacing: 0){
                        Image(systemName: "plus")
                        Text("Add New Task")
                    }
                }
                .popover(isPresented: $showingPopover) {
                    createChecklistView
                }

        }.padding(.all, 45.0)
    }
}

struct ChecklistView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        }
    }
}
