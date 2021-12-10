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
                Label(posting.author.name, systemImage: "person")
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
    static var author = PostingAuthor(name: "keith okuna")
    static var posting = Posting(_id: "abc", author: author, body: "hello", title: "test", date: "")
    static var previews: some View {
        PostingRow(posting: posting)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
