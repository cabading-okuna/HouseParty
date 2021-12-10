//
//  PostingRow.swift
//  HouseParty
//
//  Created by Keith Okuna on 10/25/21.
//
import Foundation
import SwiftUI

struct PostingRow: View {
    var posting: Posting
    
    var body: some View {
        VStack{
            HStack {
                Label("Sue Flay", systemImage: "person")
                VStack {
                    Text(posting.title)
                        .font(.headline)
                    Text(posting.body)
                }
                .padding()
                Spacer()
            }
        }
        .padding()
    }
}

struct PostingRow_Previews: PreviewProvider {
    static var posting = Posting(_id: "abc", userId: "123", body: "hello", title: "test", date: 0)
    static var previews: some View {
        PostingRow(posting: posting)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
