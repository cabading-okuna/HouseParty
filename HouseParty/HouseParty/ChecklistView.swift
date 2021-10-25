//
//  ChecklistView.swift
//  HouseParty
//
//  Created by Alyssandra Katrina Cabading on 10/23/21.
//

import SwiftUI

struct ChecklistView: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .center, spacing: 0){
            Text("Checklist will go here")
                .navigationBarTitle("Checklist", displayMode: .inline)
                
                
                
            }
        }.padding(.all, 15.0)
    }
}

struct ChecklistView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ChecklistView()
        }
    }
}
