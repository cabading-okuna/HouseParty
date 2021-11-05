//
//  PostTabView.swift
//  HouseParty
//
//  Created by Keith Okuna on 10/2/21.
//
import SwiftUI

struct PostTabView: View {
    @ObservedObject var viewModel: PostViewModel
    var body: some View {
        NavigationView {
            
            List(viewModel.postings) { posting in
                PostingRow(posting: posting)
            }
            .task {
                await viewModel.getPostings()
            }
        }.navigationBarTitle("Timeline", displayMode: .inline)
    }
}
