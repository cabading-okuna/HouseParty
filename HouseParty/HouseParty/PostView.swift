//
//  PostView.swift
//  HouseParty
//
//  Created by Alyssandra Katrina Cabading on 10/23/21.
//

import SwiftUI

struct PostView: View {
    var body: some View {
        ScrollView{
            Text("Create New Post and HouseParty! will go here")
                .navigationBarTitle("Checklist", displayMode: .inline)
        }.padding(.all, 15.0)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            PostView()
        }
    }
}
