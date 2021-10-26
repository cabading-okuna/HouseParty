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
        HStack {
            Text(posting.postHeading)
            Spacer()
            Text(posting.postBody)
            Spacer()
        }

    }
}

struct PostingRow_Previews: PreviewProvider {
    static var posting = Posting(id: "abc", userId: "123", postBody: "hello", postHeading: "test", postedTime: Date())
    static var previews: some View {
        PostingRow(posting: posting)
    }
}

