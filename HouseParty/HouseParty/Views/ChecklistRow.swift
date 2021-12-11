//
//  ChecklistRow.swift
//  HouseParty
//
//  Created by Alyssandra Cabading on 12/09/2021.
//
import Foundation
import SwiftUI

struct ChecklistRow: View {
    var checklistTasks: ChecklistTasks
    
    var body: some View {
        VStack{
            HStack (alignment: .center) {
                VStack {
                    Text(checklistTasks.task)
                        .font(.headline)
                }
                .padding()
                Text(checklistTasks.notes)
                }
            }
        }
    }

struct ChecklistRow_Previews: PreviewProvider {
    static var checklistTasks = ChecklistTasks(_id: "abc", userId: "123", task: "Task #1", notes: "This is sample note 1")
    static var previews: some View {
        ChecklistRow(checklistTasks: checklistTasks)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
