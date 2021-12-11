//
//  AccountView.swift
//  HouseParty
//
//  Created by Alyssandra Katrina Cabading on 10/23/21.
//

import SwiftUI

struct AccountTabView: View {
    @State private var enableNotification: Bool = true
    @State private var text: String = ""
    @EnvironmentObject var authentication: AuthenticationService

var body: some View {
        ScrollView{
            VStack(alignment: .center, spacing: 0){
                //Profile Picture
                Image(systemName: "person.crop.circle.fill.badge.plus")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.gray)
                //Profile Settings Section
                Section(header: Text("Profile Settings")) {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Edit Profile")
                    }
                    HStack(alignment: .top){
                        Text("Name")
                        Spacer()
//                        TextField(text: $text).foregroundColor(Color.gray)
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
                    Section(header: Text("Password Settings")) {
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
                Section{
                    Button("SIGN OUT") {
                        authentication.isValidated = false;
                    }
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding()
                    .cornerRadius(3.0)
                    .frame(width: 350, height: 45)
                    .background(.red)
                    .cornerRadius(30)
                    .padding(.top, 25)
                }.padding(.vertical,  8.0)
                .navigationTitle("Account")
            }
        }.padding(.all, 15.0)
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AccountTabView()
        }
    }
}
}
