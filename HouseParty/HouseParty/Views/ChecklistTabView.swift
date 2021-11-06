//
//  ChecklistView.swift
//  HouseParty
//
//  Created by Alyssandra Katrina Cabading on 10/23/21.
//

import SwiftUI

struct ChecklistTabView: View {
    var body: some View {
        NavigationView{
            VStack(alignment: .center, spacing: 0){
                HStack{
                Button(action: {}){
                    Text("Add New Task")
                    Image(systemName: "plus")
                }
                }
            List{
                Text("Walk the dog")
                Text("Water the plants")
                Text("Make breakfast")
                Text("Buy 2 bags of potato chips")
                Text("Buy 3 onions and 5 tomatoes")
                Text("Do Laundry")
                Text("Chem Homework #13")
                Text("CompSci Assignment 5")
                Text("Call mom back")
                Text("Register for classes")
            }
            }
            .navigationBarTitle("Checklist", displayMode: .inline)
            .padding(.all, 15.0)
        }
    }
}

struct ChecklistView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ChecklistTabView()
        }
    }
}
