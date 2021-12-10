//
//  ChecklistView.swift
//  HouseParty
//
//  Created by Alyssandra Katrina Cabading on 10/23/21.
//

import SwiftUI

struct ChecklistTabView: View {
        @ObservedObject var viewModel: ChecklistViewModel
    var body: some View {
        NavigationView{
            VStack(alignment: .center, spacing: 0){
                HStack{
                ChecklistButton(with: createChecklistView)        
                Button(action: {}){
                    Text("Add New Task")
                    Image(systemName: "plus")
                }
                }
            List(viewModel.checklistTasks) { checklistTasks in
                ChecklistRow(checklistTasks: checklistTasks)
            }
            .task {
                await viewModel.getChecklists()
            }
        }.refreshable {
            Task.init{
                await viewModel.getChecklists()
            }
            }
            }
            .navigationBarTitle("Checklist", displayMode: .inline)
            .padding(.all, 15.0)
        }
    }
}

struct CheckistButton: View{
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
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80.0, height: 80.0)
                            .foregroundColor(Color.black)
                        Text("Add New Task").padding(.top, 10.0).foregroundColor(Color.black)
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
            ChecklistTabView()
        }
    }
}
