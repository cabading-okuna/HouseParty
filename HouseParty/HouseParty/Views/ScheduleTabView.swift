//
//  TimelineView.swift
//  HouseParty
//
//  Created by Alyssandra Katrina Cabading on 10/23/21.
//

import SwiftUI

struct ScheduleTabView: View {
    var body: some View {
        ScrollView{
            DatePicker(selection: .constant(Date()), label: { Text("Today") })
            Divider()
            Button(action: {}){
                Text("Schedule a HouseParty!")
                Image(systemName: "plus")
            }
            Divider()
            HStack(alignment: .center){
                Image(systemName: "house")
                Text("HouseParty! IN 3 DAYS").foregroundColor(Color.gray)
            }
            .padding()
            .navigationBarTitle("Schedule", displayMode: .inline)
            
        }.padding(.all, 15.0)
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ScheduleTabView()
        }
    }
}
