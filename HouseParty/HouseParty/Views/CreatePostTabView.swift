//
//  ContentView.swift
//  HouseParty
//
//  Created by Keith Okuna on 10/2/21.
//

import SwiftUI

//Main Post View Menu
struct CreatePostTabView: View {
    let createPostView: CreatePostView;
    
    var body: some View {
            VStack(alignment: .center, spacing: 0){
                LiveButton()
                PostButton(with: createPostView)
            }.padding(.all, 100.0).frame(width: 600.0, height: 750.0).navigationBarTitle("HouseParty!", displayMode: .inline).background(LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .top, endPoint: .bottom))
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
//            CreatePostTabView()
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
        }.navigationTitle("Timeline")
    }
}

struct PostButton: View{
    @State private var showingPopover = false
    let createPostView: CreatePostView
    init (with createPostView:CreatePostView) {
        self.createPostView = createPostView
    }
    var body: some View{
        Section{
            Button(action: {
                showingPopover = true;
            } ) {
                    VStack(alignment: .center, spacing: 0){
                        Image(systemName: "camera.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80.0, height: 80.0)
                            .foregroundColor(Color.black)
                        Text("Create New Post").padding(.top, 10.0).foregroundColor(Color.black)
                    }
                }
                .popover(isPresented: $showingPopover) {
                    createPostView
                }

        }.padding(.all, 45.0)
    }
}
