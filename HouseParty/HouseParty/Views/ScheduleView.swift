//
//  TimelineView.swift
//  HouseParty
//
//  Created by Alyssandra Katrina Cabading on 10/23/21.
//

import SwiftUI

struct ScheduleView: View {
    var body: some View {
        ScrollView{
            DatePicker(selection: .constant(Date()), label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
                .navigationBarTitle("Schedule", displayMode: .inline)
            
        }.padding(.all, 15.0)
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ScheduleView()
        }
    }
}
