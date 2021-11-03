//
//  LoginView.swift
//  HouseParty
//
//  Created by Alyssandra Katrina Cabading on 10/31/21.
//

import SwiftUI

struct LoginView: View{
    @ObservedObject var loginVM: LoginViewModel
    @EnvironmentObject var authentication:  Authentication
    
    var body: some View{
        ZStack{
            VStack{
                HouseIcon()
                TextField("Email", text: $loginVM.credentials.email)
                    .padding()
                    .background(.gray)
                    .cornerRadius(3.0)
                    .padding(.bottom, 10)
                SecureField("Password", text: $loginVM.credentials.password)
                    .padding()
                    .background(.gray)
                    .cornerRadius(3.0)
                    .padding(.bottom, 10.0)
                if loginVM.showProgressView{
                    ProgressView()
                }
                Button("SIGN UP"){
                    loginVM.signup { success in
                        authentication.updateValidation(success: success)
                    }
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .cornerRadius(3.0)
                .frame(width: 200, height: 60)
                .background(.black)
                .cornerRadius(30)
                Button("SIGN IN"){
                    loginVM.login { success in
                        authentication.updateValidation(success: success)
                    }
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .cornerRadius(3.0)
                .frame(width: 200, height: 60)
                .background(.black)
                .cornerRadius(30)
            }
        }.autocapitalization(.none)
            .alert(item: $loginVM.error){ error in
                Alert(title: Text("Invalid Login"), message: Text(error.localizedDescription))
            }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
//            LoginView()
        }
    }
}

struct HouseIcon: View{
    var body: some View{
        Image("HouseImage")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 325, height: 325)
            .clipped()
    }
}
