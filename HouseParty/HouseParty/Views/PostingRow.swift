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
                Image(systemName: "user.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                Text("Houseparty Username")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
            Image(systemName: "photo")
                .renderingMode(.template)
                .resizable()
                .frame(width: 18, height: 18)
                .foregroundColor(.white)

            HStack {
                Text(posting.postHeading)
                Spacer()
                Text(posting.postBody)
                Spacer()
            }
        }
        .padding()
        .background(.white.opacity(0.05))
        .cornerRadius(15)
    }
}

struct PostingRow_Previews: PreviewProvider {
    static var posting = Posting(id: "abc", userId: "123", postBody: "hello", postHeading: "test", postedTime: Date())
    static var previews: some View {
        PostingRow(posting: posting)
    }
}
