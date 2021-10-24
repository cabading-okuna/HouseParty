//
//  AccountView.swift
//  HouseParty
//
//  Created by Alyssandra Katrina Cabading on 10/23/21.
//

import SwiftUI

struct AccountView: View {
    @State private var enableNotification: Bool = true
    
var body: some View {
        ScrollView{
            VStack(alignment: .center, spacing: 0){
                //Profile Picture
                Image(systemName: "person.crop.circle.fill")
                    .resizable(capInsets: EdgeInsets(top: 100.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                    .frame(width: 110, height: 110)
                    .foregroundColor(Color.gray)
                //Profile Settings Section
                Section(header: Text("Profile Settings")) {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Edit Profile")
                    }
                    HStack(alignment: .top){
                        Text("Username")
                        Spacer()
                        Text("SooFlay").foregroundColor(Color.gray)
                    }
                    HStack(alignment: .top){
                        Text("First Name")
                        Spacer()
                        Text("Sue").foregroundColor(Color.gray)
                    }
                    HStack(alignment: .top){
                        Text("Last Name")
                        Spacer()
                        Text("Flay").foregroundColor(Color.gray)
                    }
                    HStack(alignment: .top){
                        Text("Email")
                        Spacer()
                        Text("sueflay@gmail.com")
                    }
                    HStack(alignment: .top){
                        Text("Phone Number")
                        Spacer()
                        Text("+1(808) 123-4567").foregroundColor(Color.gray)
                    }
                }.padding(.vertical, 8.0)
                Divider()
                //Notification Section
                Section(header: Text("Notification Settings")) {
                    Toggle(isOn: $enableNotification){
                        Text("Enable Schedule Notification")
                            
                    }.padding(.all)
                //Password Section
                Divider()
                    Section(header: Text("Password Setting")) {
                        HStack(alignment: .top){
                            Text("Password")
                            Spacer()
                            //SecureField(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/"Password"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("Apple")/*@END_MENU_TOKEN@*/)
                            Text("*********")
                        }
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            Text("Change Password")
                                .multilineTextAlignment(.center)
                        }
                    }.padding(.vertical,  8.0)
                }.padding(.top,  8.0)
            }
            .navigationBarTitle("Account", displayMode: .inline)
        }.padding(.all, 15.0)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AccountView()
        }
    }
}
