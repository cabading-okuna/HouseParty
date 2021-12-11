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
            DatePicker(
                "Today",
                selection: .constant(Date()),
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)

            Divider()
            Button(action: {}){
                Text("Schedule a HouseParty!")
                Image(systemName: "plus")
            }
            Divider()
            HStack(alignment: .center){
                Image(systemName: "house")
                    .padding(.trailing)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 5.0, height: 5.0)
                Text("4").font(.title)
                Spacer()
                Text("HouseParty! IN 3 DAYS at 6:30pm").foregroundColor(Color.gray)
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
