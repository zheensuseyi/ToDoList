//
//  TaskDescriptionView.swift
//  ToDoList
//
//  Created by Zheen Suseyi on 2/10/25.
//

import SwiftUI

// screen for showing the description of the tapped task
struct TaskDescriptionView: View {
    // default description, will get changed depending on task
    var description: String = "Task Description"
    var body: some View {
            VStack {
                // title
                Text("Task Description")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                // scrollview for the description so it can be as long as one desires
                ScrollView {
                    // this description will change depending on task tapped on
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
