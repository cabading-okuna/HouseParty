//
//  SigninView.swift
//  HouseParty
//
//  Created by Alyssandra Katrina Cabading on 10/24/21.
//

import SwiftUI

let admin = "Admin"
let adminPassword = "Changeme"

let lightGray = Color(red:235.0/255.0, green:239.0/255.0, blue:240.0/255.0)

struct SigninView: View {
    
    @State var authenticationFail: Bool = false
    @State var authenticationSucceed: Bool = false

    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        ZStack{
            VStack{
                Welcome()
                HouseIcon()
                UsernameView(username: $username)
                PasswordView(password: $password)
                if authenticationFail{
                    Text("User not found. Please try again.")
                        .italic().foregroundColor(.gray)
                }
                Button(action: {
                    if self.username == admin && self.password == adminPassword{
                        self.authenticationSucceed = true
                    } else {
                        self.authenticationFail = true
                    }
                }){
                    LoginView()
                }
            }.padding()
            if authenticationSucceed{
                Text("Login Successful.")
            }
        }
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SigninView()
        }
    }
}


struct Welcome: View{
    var body: some View{
    Text("Welcome to HouseParty!")
        .font(.largeTitle)
        .fontWeight(.semibold)
        .padding(.bottom, 20)
    }
}

struct HouseIcon: View{
    var body: some View{
        Image(systemName: "house.circle.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
            .clipped()
            .padding(.bottom, 75)
    }
}

struct LoginView: View {
    var body: some View {
        Text("SIGN IN")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .cornerRadius(3.0)
            .frame(width: 200, height: 60)
            .background(Color.black)
            .cornerRadius(30)
    }
}

struct UsernameView: View {
    @Binding var username: String
    
    var body: some View {
        TextField("Username", text: $username)
            .padding()
            .background(lightGray)
            .cornerRadius(3.0)
            .padding(.bottom, 10)
    }
}

struct PasswordView: View {
    @Binding var password: String

    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(lightGray)
            .cornerRadius(3.0)
            .padding(.bottom, 10.0)
    }
}
