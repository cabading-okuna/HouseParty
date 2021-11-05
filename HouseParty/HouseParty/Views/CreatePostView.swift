//
//  CreatePost.swift
//  HouseParty
//
//  Created by Alyssandra Katrina Cabading on 11/4/21.
//
import Foundation
import SwiftUI

struct CreatePostView: View {
    @ObservedObject var vm: CreatePostViewModel
    
    var posting: Posting
    
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Button("Post") {
                    Task.init {
                        await vm.save()
                    }
                }
            }
            Section(header: Text("Title")) {
                TextField("Title...", text: $vm.post.title)
            }
            Section(header: Text("Post")) {
                TextEditor(text: $vm.post.body)
            }
        }.navigationTitle("New Post")
    }
}
