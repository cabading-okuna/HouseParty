//
//  ContentView.swift
//  HouseParty
//
//  Created by Keith Okuna on 10/2/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel
    var body: some View {
        NavigationView {
            List(viewModel.postings) { posting in
                PostingRow(posting: posting)
            }
            .task {
                await viewModel.getPostings()
            }
        }.navigationTitle("Timeline")
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var posting = Posting(id: "abc", userId: "123", postBody: "hello", postHeading: "test", postedTime: Date())
//
//    static var previews: some View {
//
//    }
//}
