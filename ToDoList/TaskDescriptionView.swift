//
//  TaskDescriptionView.swift
//  ToDoList
//
//  Created by Zheen Suseyi on 2/10/25.
//

import SwiftUI

// FIXME: Maybe make this screen a little prettier 
// this view basically just shows the task description of the specific task tapped
struct TaskDescriptionView: View {
    var description: String = "Task Description"
    var body: some View {
            VStack {
                Text("Task Description")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                ScrollView {
                    Text("\(description)")
                        .font(.headline)
                }
                .padding()
            }
        }
    }


#Preview {
    TaskDescriptionView()
}
