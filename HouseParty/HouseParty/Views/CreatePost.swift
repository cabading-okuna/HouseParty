//
//  CreatePost.swift
//  HouseParty
//
//  Created by Alyssandra Katrina Cabading on 11/4/21.
//
import Foundation
import SwiftUI

struct CreatePost: View {
    @ObservedObject var createPostData: CreatePostModel
    
    var posting: Posting
    
    var body: some View {
        VStack{
            HStack (spacing: 10){
                Button(action: {}){
                    Text("Cancel")
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                    }
                Spacer(minLength: 0)
                // this button won't do anything yet
                Button(action: {}){
                    Image(systemName: "photo.fill")
                        .font(.title)
                        .foregroundColor(.black)
                }
            
                Button(action: {}){
                    Text("Post")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .padding(.horizontal, 20)
                        .background(.blue)
                        .clipShape(Capsule())
                }
                
              //  TextEditor(text: $createPostData.postHeading)
              //      .padding()
              //  TextEditor(text: $createPostData.postBody)
              //      .padding()
              // time and date automatic
            }
        }
    }
}
