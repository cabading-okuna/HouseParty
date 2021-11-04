//
//  PostView.swift
//  HouseParty
//
//  Created by Alyssandra Katrina Cabading on 10/23/21.
//

import SwiftUI

//Main Post View Menu
struct LiveView: View {
    var body: some View {
            VStack(alignment: .center, spacing: 0){
                LiveButton()
                PostButton()
            }.padding(.all, 100.0).frame(width: 600.0, height: 750.0).navigationBarTitle("HouseParty!", displayMode: .inline).background(LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .top, endPoint: .bottom))
    }
}

struct LiveView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            LiveView()
        }
    }
}


struct LiveButton: View{
    var body: some View{
        Section{
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                VStack(alignment: .center, spacing: 0){
                    Image(systemName: "video.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80.0, height: 80.0)
                        .foregroundColor(Color.black)
                    Text("Start a HouseParty!").padding(.top, 10.0).foregroundColor(Color.black)
                }
            }
        }.padding(.all, 45.0)
    }
}

struct PostButton: View{
    var body: some View{
        Section{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    VStack(alignment: .center, spacing: 0){
                        Image(systemName: "camera.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80.0, height: 80.0)
                            .foregroundColor(Color.black)
                        Text("Create New Post").padding(.top, 10.0).foregroundColor(Color.black)
                    }
                }
        }.padding(.all, 45.0)
    }
}
